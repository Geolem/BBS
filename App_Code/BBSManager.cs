using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using System.Xml;
using System.IO;
using System.Data.SqlClient;

/// <summary>
/// BBSManager 的摘要说明
/// </summary>
public class BBSManager
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_BBSINFO = "INSERT INTO BBSInfo VALUES " +
        "(@title,@filename,@posttime,@replycount,@lastreplytime, @postuser,@categoryid)";
    private const string PARM_BBS_TITLE = "@title";
    private const string PARM_BBS_FILENAME = "@filename";
    private const string PARM_BBS_POSTTIME = "@posttime";
    private const string PARM_BBS_REPLYCOUNT = "@replycount";
    private const string PARM_BBS_LASTREPLYTIME = "@lastreplytime";
    private const string PARM_BBS_POSTUSER = "@postuser";
    private const string PARM_BBS_CATEGORYID = "@categoryid";
    
    public static string xmlfilename = "";
    public static string categoryid = "";
    public static string infoid = "";

	public BBSManager()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public bool AddBBSCategory(string name, string des)
    {
        StringBuilder strSQL = new StringBuilder();

        SqlParameter[] newsParms = new SqlParameter[]{
            new SqlParameter("@name", SqlDbType.NVarChar,20),
            new SqlParameter("@des", SqlDbType.NVarChar,100)};

        SqlCommand cmd = new SqlCommand();
        newsParms[0].Value = name;
        newsParms[1].Value = des;

        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);

        using (SqlConnection conn = 
            new SqlConnection(SqlHelper.ConnectionStringLocalTransaction ))
        {
            strSQL.Append("Insert into BBSCategory values(@name,@des)");
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            if (val > 0)
                return true;
            else
                return false;
        }
    }

    public void AddXML(string filename, string title, string content, string user)
    {
        XmlDocument mydoc = new XmlDocument();
        mydoc.Load(filename);
        //添加元素-帖子主题
        XmlElement ele = mydoc.CreateElement("title");
        XmlText text = mydoc.CreateTextNode(title);
        //添加元素-发帖时间
        XmlElement ele1 = mydoc.CreateElement("posttime");
        XmlText text1 = mydoc.CreateTextNode(DateTime.Now.ToString());
        //添加元素-内容
        XmlElement ele2 = mydoc.CreateElement("content");
        XmlText text2 = mydoc.CreateTextNode(content);
        //添加元素-发帖人
        XmlElement ele3 = mydoc.CreateElement("postuser");
        XmlText text3 = mydoc.CreateTextNode(user);

        //添加文件的节点-msgrecord
        XmlNode newElem = mydoc.CreateNode("element", "xmlrecord", "");
        //在节点中添加元素
        newElem.AppendChild(ele);
        newElem.LastChild.AppendChild(text);
        newElem.AppendChild(ele1);
        newElem.LastChild.AppendChild(text1);
        newElem.AppendChild(ele2);
        newElem.LastChild.AppendChild(text2);
        newElem.AppendChild(ele3);
        newElem.LastChild.AppendChild(text3);
        //将节点添加到文档中
        XmlElement root = mydoc.DocumentElement;
        root.AppendChild(newElem);

        int index = filename.LastIndexOf(@"\");
        string path = filename.Substring(0, index);
        path = path + @"\" + xmlfilename + "file.xml";
        FileStream mystream = File.Create(path);
        mystream.Close();

        XmlTextWriter mytw = new XmlTextWriter(path, Encoding.Default);
        mydoc.Save(mytw);
        mytw.Close();

    }

    public void AddMsg(string title, string user, string categoryid)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] newsParms = GetParameters();
        SqlCommand cmd = new SqlCommand();
        newsParms[0].Value = title;
        newsParms[1].Value = getFilename().ToString();
        xmlfilename = getFilename().ToString();
        newsParms[2].Value = DateTime.Now;
        newsParms[3].Value = 0;
        newsParms[4].Value = DateTime.Now;
        newsParms[5].Value = user;
        newsParms[6].Value = categoryid;

        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);
        using (SqlConnection  conn =
            new SqlConnection (SqlHelper.ConnectionStringLocalTransaction ))
        {
            strSQL.Append(SQL_INSERT_BBSINFO);
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
        }
    }

    public  bool UpdateMsg(int infoid)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] newsParms = new SqlParameter[]
        {
            new SqlParameter ("@lastposttime", SqlDbType .DateTime ),
            new SqlParameter ("@infoid", SqlDbType .Int )
        };
        SqlCommand cmd = new SqlCommand();
        newsParms[0].Value = DateTime.Now;
        newsParms[1].Value = infoid;

        foreach (SqlParameter parm in newsParms )
        {
            cmd.Parameters.Add(parm);
        }
        using (SqlConnection conn =
            new SqlConnection(SqlHelper .ConnectionStringLocalTransaction ))
        {
            strSQL.Append(
                @"UPDATE BBSInfo SET Replycount=Replycount+1,
                Lastreplytime=@lastposttime WHERE InfoID=@infoid");
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            if (val > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    public void UpdateXml(string filename, string title, string content, string user )
    {
        XmlDocument mydoc = new XmlDocument();
        mydoc.Load(filename);

        //添加元素-帖子主题
        XmlElement ele = mydoc.CreateElement("title");
        XmlText text = mydoc.CreateTextNode(title);
        //添加元素-发帖时间
        XmlElement ele1 = mydoc.CreateElement("posttime");
        XmlText text1 = mydoc.CreateTextNode(DateTime.Now.ToString());
        //添加元素-内容
        XmlElement ele2 = mydoc.CreateElement("content");
        XmlText text2 = mydoc.CreateTextNode(content);
        //添加元素-发帖人
        XmlElement ele3 = mydoc.CreateElement("postuser");
        XmlText text3 = mydoc.CreateTextNode(user);

        //添加文件的节点-msgrecord
        XmlNode newElem = mydoc.CreateNode("element", "xmlrecord", "");
        //在节点中添加元素
        newElem.AppendChild(ele);
        newElem.LastChild.AppendChild(text);
        newElem.AppendChild(ele1);
        newElem.LastChild.AppendChild(text1);
        newElem.AppendChild(ele2);
        newElem.LastChild.AppendChild(text2);
        newElem.AppendChild(ele3);
        newElem.LastChild.AppendChild(text3);
        //将节点添加到文档中
        XmlElement root = mydoc.DocumentElement;
        root.AppendChild(newElem);
        //保存所有的修改
        mydoc.Save(filename);
    }

    private static SqlParameter [] GetParameters()
    {
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_BBSINFO);

        if (parms == null )
        {
            parms = new SqlParameter[] {
                new SqlParameter (PARM_BBS_TITLE ,SqlDbType.NVarChar ,50),
                new SqlParameter (PARM_BBS_FILENAME ,SqlDbType .NVarChar ,100),
                new SqlParameter (PARM_BBS_POSTTIME, SqlDbType .DateTime),
                new SqlParameter (PARM_BBS_REPLYCOUNT, SqlDbType .Int),
                new SqlParameter (PARM_BBS_LASTREPLYTIME , SqlDbType .DateTime ),
                new SqlParameter (PARM_BBS_POSTUSER , SqlDbType .NVarChar , 50),
                new SqlParameter (PARM_BBS_CATEGORYID , SqlDbType .Int ) };
            SqlHelper.CacheParameters(SQL_INSERT_BBSINFO, parms);
        }
        return parms;
    }

    private int getFilename()
    {
        int cardrule = 0;
        string strsql = "select top 1 InfoID from BBSInfo order by InfoID desc";
        try
        {
            cardrule = (int)SqlHelper.ExecuteScalar(
                SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, strsql, null);
        }
        catch
        {
            cardrule = 0;
        }
        return cardrule + 1;
    }

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twitterizer;

public partial class Home : System.Web.UI.Page
{
    string ckey = "qWBYJCeE71d9Yhqgt6JDQ";
    string csec = "eofIL3PIPFdnfTIS7HGh4CNU0vwOkmqZyvgo24dA";
    decimal uidd;
    protected void Page_Load(object sender, EventArgs e)
    {
        uidd = decimal.Parse(Session["uid"].ToString());
        getinfo();
        utimeline();
        
    }

    public void getinfo()
    {
        TwitterResponse<TwitterUser> user = TwitterUser.Show(uidd);
        try
        {
            Image1.ImageUrl = user.ResponseObject.ProfileImageLocation;
            Label2.Text = "Followers: " + user.ResponseObject.NumberOfFollowers;
            Label3.Text = "Following: " + user.ResponseObject.NumberOfFriends;
            Label4.Text = "Tweets: " + user.ResponseObject.NumberOfStatuses;
            Label1.Text = user.ResponseObject.Name;
            Label5.Text = "@"+user.ResponseObject.ScreenName;
            Label17.Text = "On Twitter Since: "+user.ResponseObject.CreatedDate;
            Label16.Text = "Favorites: " + user.ResponseObject.NumberOfFavorites;
            Label18.Text = "Verified Status: " + user.ResponseObject.Verified;
            Label15.Text = "Welcome "+user.ResponseObject.Name;
        }
        catch
        {
        }
    }

    public void utimeline()
    {
        OAuthTokens token = new OAuthTokens();
        token.AccessToken = Session["tokenS"].ToString();
        token.AccessTokenSecret = Session["Atoken"].ToString();
        token.ConsumerKey = ckey;
        token.ConsumerSecret = csec;
        TwitterResponse<TwitterStatusCollection> tweets = TwitterTimeline.UserTimeline(token);
        TwitterResponse<TwitterStatusCollection> retweets = TwitterTimeline.RetweetedByMe(token);
        TwitterResponse<TwitterStatusCollection> mentions = TwitterTimeline.Mentions(token);
        List<tstat> statuscol = new List<tstat>();
        foreach (TwitterStatus tw in tweets.ResponseObject)
        {
            tstat pair = new tstat();
            pair.pimg = tw.User.ProfileImageLocation;
            pair.stat = tw.Text;
            pair.name = tw.User.Name;
            pair.scname = "@"+tw.User.ScreenName;
            statuscol.Add(pair);
        }
        GridView1.DataSource = statuscol;
        GridView1.DataBind();

        List<tstat> retweet = new List<tstat>();
        foreach (TwitterStatus tw in retweets.ResponseObject)
        {
            tstat rpair = new tstat();
            rpair.pimg = tw.RetweetedStatus.User.ProfileImageLocation;
            rpair.stat = tw.RetweetedStatus.Text;
            rpair.scname = "@" + tw.RetweetedStatus.User.ScreenName;
            rpair.name = tw.RetweetedStatus.User.Name;
            retweet.Add(rpair);
        }
        GridView3.DataSource = retweet;
        GridView3.DataBind();

        List<tstat> ment = new List<tstat>();
        foreach (TwitterStatus tw in mentions.ResponseObject)
        {
            tstat mpair = new tstat();
            mpair.pimg = tw.User.ProfileImageLocation;
            mpair.stat = tw.Text;
            mpair.scname = "@" + tw.User.ScreenName;
            mpair.name = tw.User.Name;
            ment.Add(mpair);
        }
        GridView4.DataSource = ment;
        GridView4.DataBind();
    }
       
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        OAuthTokens token = new OAuthTokens();
        token.AccessToken = Session["tokenS"].ToString();
        token.AccessTokenSecret = Session["Atoken"].ToString();
        token.ConsumerKey = ckey;
        token.ConsumerSecret = csec;
        TwitterResponse<TwitterStatus> tweetstatus = TwitterStatus.Update(token,TextBox1.Text);
        if (tweetstatus.Result == RequestResult.Success)
        {
            Label6.Text = "Your message was posted successfully";
            
        }
        else
        {
            Label6.Text = "Your message failed to update";
        }
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TwitterResponse<TwitterSearchResultCollection> searchresult = TwitterSearch.Search(TextBox2.Text);
        List<tstat> searched = new List<tstat>();
        foreach (TwitterSearchResult tsr in searchresult.ResponseObject)
        {
            tstat pair = new tstat();
            pair.pimg = tsr.ProfileImageLocation;
            pair.stat = tsr.Text;
            pair.scname = "@" + tsr.FromUserScreenName;
            pair.name = "";
            searched.Add(pair);
        }
        GridView2.DataSource = searched;
        GridView2.DataBind();
    }

    public class tstat
    {
        public string pimg { get; set;}
        public string stat { get; set;}
        public string scname { get; set; }
        public string name { get; set; }
    }

    public class rstat
    {
        public string rpimg { get; set; }
        public string rtstat { get; set; }
    }

    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
    }
    protected void GridView4_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView4.PageIndex = e.NewPageIndex;
    }
}

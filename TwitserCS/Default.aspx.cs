using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twitterizer;

public partial class _Default : System.Web.UI.Page
{
    string ckey="qWBYJCeE71d9Yhqgt6JDQ";
    string csec="eofIL3PIPFdnfTIS7HGh4CNU0vwOkmqZyvgo24dA";
    string cba="http://127.0.0.1:1213/TwitserCS/redirect.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            OAuthTokenResponse authtoken = OAuthUtility.GetRequestToken(ckey, csec, cba);
            Response.Redirect(string.Format("http://twitter.com/oauth/authorize?oauth_token={0}", authtoken.Token), true);
        }
        catch
        {
        }
    }
}


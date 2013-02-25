using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twitterizer;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ckey="Your_Client_key";
        string csec="Your Client Secret";
        OAuthTokenResponse tokens = OAuthUtility.GetAccessTokenDuringCallback(ckey, csec);
        Session["tokenS"] = tokens.Token;
        Session["Atoken"] = tokens.TokenSecret;
        Session["sname"] = tokens.ScreenName;
        Session["uid"] = tokens.UserId;
       
        Response.Redirect("home.aspx");
    }
}

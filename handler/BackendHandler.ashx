<%@ WebHandler Language="C#" Class="AutoRequestSourceHandler" %>

using System.Web;
using MarvalSoftware.UI.WebUI.ServiceDesk.RFP.Plugins;
using Newtonsoft.Json;

/// <summary>
/// Auto Request Source Plugin Handler
/// </summary>
public class AutoRequestSourceHandler : PluginHandler
{
    public override bool IsReusable { get { return false; } }

    /// <summary>
    /// Main Request Handler
    /// </summary>
    public override void HandleRequest(HttpContext context)
    {
        switch (context.Request.HttpMethod)
        {
            case "GET":
                context.Response.Write(JsonConvert.SerializeObject(new PluginSettings(this.GlobalSettings["Default Source ID"])));
                break;
        }
    }

    public class PluginSettings
    {
        public int defaultSourceId { get; set; }
        public PluginSettings(string DefaultSourceID) { 
			defaultSourceId = String2Int0(DefaultSourceID); 
		}
    }

	public static int String2Int0(string ints)
	{
		int i = 0;
		return System.Int32.TryParse((ints ?? string.Empty), out i) ? i : 0;
	}

}
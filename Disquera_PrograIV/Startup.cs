using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Disquera_PrograIV.Startup))]
namespace Disquera_PrograIV
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

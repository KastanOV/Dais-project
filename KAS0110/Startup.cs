using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KAS0110.Startup))]
namespace KAS0110
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

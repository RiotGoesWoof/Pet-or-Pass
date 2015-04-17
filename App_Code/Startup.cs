using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PetorPass.Startup))]
namespace PetorPass
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

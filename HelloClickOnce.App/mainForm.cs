using System;
using System.Deployment.Application;
using System.Windows.Forms;

namespace HelloClickOnce.App
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            if (ApplicationDeployment.IsNetworkDeployed)
            {
                var version = ApplicationDeployment.CurrentDeployment.CurrentVersion;
                VersionLabel.Text = $"Version: {version}";
            }

        }
    }
}

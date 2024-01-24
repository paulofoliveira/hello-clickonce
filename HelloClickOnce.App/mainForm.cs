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
            if (!ApplicationDeployment.IsNetworkDeployed)
                return;

            var currentDeployment = ApplicationDeployment.CurrentDeployment;

            var updateCheckInfo = currentDeployment.CheckForDetailedUpdate();

            if (updateCheckInfo.UpdateAvailable)
                UpgradeButton.Text = $"Upgrade to {updateCheckInfo.AvailableVersion}";

            UpgradeButton.Visible = updateCheckInfo.UpdateAvailable;
            VersionLabel.Text = $"Version: {currentDeployment.CurrentVersion}";
        }

        private void UpgradeButton_Click(object sender, EventArgs e)
        {
            if (!ApplicationDeployment.IsNetworkDeployed)
                return;

            var currentDeployment = ApplicationDeployment.CurrentDeployment;
            currentDeployment.Update();

            Application.Restart();
        }
    }
}

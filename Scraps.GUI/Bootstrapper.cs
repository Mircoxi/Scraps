#region License
/// Scraps - Scrap.TF Raffle Bot
/// Copyright(C) 2022 Caprine Logic

/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.

/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// GNU General Public License for more details.

/// You should have received a copy of the GNU General Public License
/// along with this program. If not, see <https://www.gnu.org/licenses/>.
#endregion License

using Scraps.GUI.Forms;
using Scraps.GUI.Constants;

namespace Scraps.GUI
{
    static class Bootstrapper
    {
        [STAThread]
        static void Main(string[] args)
        {
            EnsureFileSystem();

            if (!IsAlreadyRunning())
            {
                if (Properties.UserConfig.Default.UpgradeRequired)
                {
                    Properties.UserConfig.Default.Upgrade();
                    Properties.UserConfig.Default.UpgradeRequired = false;
                    Properties.UserConfig.Default.Save();
                }

                Application.SetHighDpiMode(HighDpiMode.SystemAware);
                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                Application.Run(new MainForm(args));
            }
        }

        static bool IsAlreadyRunning() => Process.GetProcesses().Count(p => p.ProcessName == Process.GetCurrentProcess().ProcessName) > 1;

        static void EnsureFileSystem()
        {
            foreach (string path in new string[]
            {
                Paths.LOGS_PATH,
                Paths.DATA_PATH,
            })
            {
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
            }
        }
    }
}

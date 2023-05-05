using MoneyInEveryPocket.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MoneyInEveryPocket
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Content = new LoginPage(SPFuncs);
        }

        private void btnProfile_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new AccountInfoPage();
        }

        private void btnHistory_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new OperationsPage();
        }

        private void btnHome_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new DepositsPage();
        }

        private void btnLogOut_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Content = new LoginPage(SPFuncs);
            SPFuncs.Visibility = Visibility.Hidden;
        }
    }
}

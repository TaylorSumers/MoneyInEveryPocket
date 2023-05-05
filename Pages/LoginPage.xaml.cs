using MoneyInEveryPocket.DatabaseModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static MoneyInEveryPocket.DatabaseModel.AppConnect;


namespace MoneyInEveryPocket.Pages
{
    /// <summary>
    /// Interaction logic for LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        static StackPanel SP;

        public LoginPage(StackPanel SPFunc)
        {
            InitializeComponent();
            SP = SPFunc;
            FillEmail();
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            int res = FindUser(tbxEmail.Text, pbxPass.Password);
            switch (res)
            {
                case 0: 
                    MessageBox.Show("Пользователь не найден", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error); 
                    break;
                case 1:
                    MessageBox.Show("Неверный пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    break;
                case 2:
                    if (cbxRememberMe.IsChecked == true)
                        RememberEmail();
                    else
                        DeleteEmail();
                    NavigationService.Navigate(new DepositsPage());
                    SP.Visibility = Visibility.Visible;
                    SP.DataContext = CurrentUser;
                    break;
            }
        }

        private int FindUser(string UserEmail, string UserPassword) 
        {
            User CurrentUser = cont.User.Where(user => user.UserEmail == UserEmail).SingleOrDefault();
            if (CurrentUser != null) 
            {
                if (CurrentUser.UserPassword == UserPassword)
                {
                    AppConnect.CurrentUser = CurrentUser;
                    return 2;
                }
                else 
                    return 1;
            }
            else
                return 0;
        }

        private void RememberEmail()
        {
            var userEmail = tbxEmail.Text;
            using (var writer = new StreamWriter("Email.txt", false))
            {
                writer.WriteLine(userEmail);
            }
        }

        private void FillEmail()
        {
            string email;
            try
            {
                using(var reader = new StreamReader("Email.txt", false))
                {
                    email = reader.ReadLine();
                }
            }
            catch
            {
                return;
            }
            tbxEmail.Text = email;
            cbxRememberMe.IsChecked = true;
        }

        private void DeleteEmail()
        { 
            File.Delete("Email.txt");
        }

        private void btnToReg_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegPage(SP));
        }
    }
}

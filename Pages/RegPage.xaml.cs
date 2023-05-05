using System;
using System.Collections.Generic;
using System.Drawing.Printing;
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
using MoneyInEveryPocket.DatabaseModel;
using static MoneyInEveryPocket.DatabaseModel.AppConnect;

namespace MoneyInEveryPocket.Pages
{
    /// <summary>
    /// Interaction logic for RegPage.xaml
    /// </summary>
    public partial class RegPage : Page
    {
        StackPanel SP;

        public RegPage(StackPanel SPFunc)
        {
            InitializeComponent();
            SP = SPFunc;
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            Reset();
            bool isPersonalDataValid = ValidatePersonalData(tbxName.Text, tbxSurname.Text, tbxPhone.Text);
            int isAuthDataValid = ValidateAuthData(tbxEmail.Text, psxPass.Password);
            if (isPersonalDataValid && isAuthDataValid == 4) // all data is valid
            {
                CreateNewUser();
                MessageBox.Show("Регистрация успешна", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.Navigate(new DepositsPage());
            }
            else // something wrong
            {
                string Message = "";
                if (!isPersonalDataValid || isAuthDataValid == 0)
                    Message += "Неккоректно введены данные в выделенных полях;\n";
                switch (isAuthDataValid)
                {
                    case 1:
                        Message += "Пользователь с таким адресом электронной почты уже существует\n";
                        break;
                    case 2:
                        Message += "Пароль должен включать минимум 6 символов\n";
                        break;
                    case 3:
                        Message += "Пароли не совпадают";
                        break;
                }
                MessageBox.Show(Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Checks the personal data
        /// </summary>
        /// <returns> true if data is valid, else false</returns>
        private bool ValidatePersonalData(string Name, string Surname, string Phone)
        {
            bool IsDataValid = true;
            if (Name == "")
            {
                tbxName.BorderBrush = Brushes.Red;
                IsDataValid = false;
            }
            if (Surname == "")
            {
                tbxSurname.BorderBrush = Brushes.Red;
                IsDataValid = false;
            }
            if (!(Phone.Length == 11 && Phone.All(char.IsDigit)))
            {
                tbxPhone.BorderBrush = Brushes.Red;
                IsDataValid = false;
            }

            return IsDataValid;
        }

        /// <summary>
        /// Checks the Email and the Password
        /// </summary>
        /// <returns>
        /// 0 - if email is empty or whitespase
        /// 1 - if email already exists,
        /// 2 - if password length less than 6,
        /// 3 - if passwords don't match,
        /// 4 - if all OK
        /// </returns>
        private int ValidateAuthData(string UserEmail, string UserPassword)
        {
            var Dupls = cont.User.Where(user => user.UserEmail == UserEmail).ToList();
            if (String.IsNullOrWhiteSpace(UserEmail))
            {
                tbxEmail.BorderBrush = Brushes.Red;
                return 0;
            }
            if (Dupls.Count() > 0)
            {
                tbxEmail.BorderBrush = Brushes.Red;
                return 1;
            }
            if (UserPassword.Length < 6)
            {
                psxPass.BorderBrush = Brushes.Red;
                return 2;
            }
            if (UserPassword != psxPassRep.Password)
            {
                psxPassRep.BorderBrush = Brushes.Red;
                return 3;
            }
            return 4;
        }

        /// <summary>
        /// Sets borders of each textbox to gray
        /// </summary>
        private void Reset()
        {
            tbxName.BorderBrush = Brushes.Gray;
            tbxSurname.BorderBrush = Brushes.Gray;
            tbxPhone.BorderBrush = Brushes.Gray;
            tbxEmail.BorderBrush= Brushes.Gray;
            psxPass.BorderBrush = Brushes.Gray;
            psxPassRep.BorderBrush = Brushes.Gray;
        } 

        /// <summary>
        /// Creates the new user with entered information
        /// </summary>
        private void CreateNewUser()
        {
            User NewUser = new User
            {
                UserName = tbxName.Text,
                UserSurname = tbxSurname.Text,
                UserPatronymic = tbxPatronymic.Text,
                UserPhone = tbxPhone.Text,
                UserEmail = tbxEmail.Text,
                UserPassword = psxPass.Password
            };
            cont.User.Add(NewUser);
            cont.SaveChanges();
            CurrentUser = NewUser;
        }

        private void btnToAuth_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new LoginPage(SP));
        }
    }
}

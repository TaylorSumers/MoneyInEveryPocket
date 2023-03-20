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
        public RegPage()
        {
            InitializeComponent();
        }
        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            Reset();
            bool IsDataValid = ValidateData(tbxName.Text, tbxSurname.Text, tbxPhone.Text);
            int IsEmailPasValid = ValidateLogPas(tbxEmail.Text, psxPass.Password);
            if (IsDataValid && IsEmailPasValid == 4) // all data is valid
            {
                CreateNewUser();
                MessageBox.Show("Данные внесены");
            }
            else
            {
                string Message = "";
                if (!IsDataValid || IsEmailPasValid == 0)
                    Message += "Неккоректно введены данные в выделенных полях;\n";
                switch (IsEmailPasValid)
                {
                    case 1:
                        Message += "Пользователь с таким адресом электронной почты уже существует;\n";
                        break;
                    case 2:
                        Message += "Пароль должен включать минимум 6 символов;\n";
                        break;
                    case 3:
                        Message += "Пароли не совпадают";
                        break;
                }
                MessageBox.Show(Message);
            }
        }
        private bool ValidateData(string Name, string Surname, string Phone) // Checks the personal data
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

        private int ValidateLogPas (string UserEmail, string UserPassword) // Checks the Email and the Password
        {
            // Returns
            // 0 - if email is empty or whitespase
            // 1 - if email already exists,
            // 2 - if password length less than 6,
            // 3 - if passwords don't match,
            // 4 - if all OK

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
        
        private void Reset() // Sets borders of each textbox to gray
        {
            tbxName.BorderBrush = Brushes.Gray;
            tbxSurname.BorderBrush = Brushes.Gray;
            tbxPhone.BorderBrush = Brushes.Gray;
            tbxEmail.BorderBrush= Brushes.Gray;
            psxPass.BorderBrush = Brushes.Gray;
            psxPassRep.BorderBrush = Brushes.Gray;
        } 

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
        }
    }
}

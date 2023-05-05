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
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Microsoft.Win32;
using MoneyInEveryPocket.DatabaseModel;
using MoneyInEveryPocket.Pages;
using static MoneyInEveryPocket.DatabaseModel.AppConnect;

namespace MoneyInEveryPocket.Pages
{
    /// <summary>
    /// Логика взаимодействия для AccountInfoPage.xaml
    /// </summary>
    public partial class AccountInfoPage : Page
    {
        public AccountInfoPage()
        {
            InitializeComponent();
            InitializePage();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            Clear();
            if (ValidateData())
            {
                cont.SaveChanges();
                MessageBox.Show("Данные сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
                MessageBox.Show("Некорректно заполнены данные в выделенных полях", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            
        }

        private void btnChangePhoto_Click(object sender, RoutedEventArgs e)
        {
            // TODO: Photo must change in user icon in upper right corner
            var fileDialog = new OpenFileDialog();
            fileDialog.Filter = "Images (*.jpg; *.png) | *.jpg; *.png";
            if(fileDialog.ShowDialog() == true)
            {
                var path = fileDialog.FileName;
                imgUser.Source = new BitmapImage(new Uri(path));
                CurrentUser.UserImage = File.ReadAllBytes(path);
            }
        }

        private void CreatePassport()
        {
            var passport = new Passport()
            {
                PassportID = CurrentUser.UserID,
                PassportSeries = Convert.ToInt32(tbxSeries.Text),
                PassportNumber = Convert.ToInt32(tbxNum.Text),
                PassportIssueDate = (DateTime)dpDateOfIssue.SelectedDate,
                PassportIssueOrg = (int)cbxOrg.SelectedValue
            };
            cont.Passport.Add(passport);

            var address = new Address()
            {
                AddressCity = (int)cbxCity.SelectedValue,
                AddressStreet = (int)cbxStreet.SelectedValue,
                AddressHouse = tbxHouse.Text,
                AddressBuilding = tbxBuilding.Text,
                AddressApartment = tbxApartment.Text
            };
            cont.Address.Add(address);
            CurrentUser.UserAddress = address.AddressID;
            MessageBox.Show("После проверки ваша учётная запись получит статус \"подтвержденная\".", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void InitializePage()
        {
            DataContext = CurrentUser;

            cbxCity.ItemsSource = cont.City.ToList();
            cbxStreet.ItemsSource = cont.Street.ToList();
            cbxOrg.ItemsSource = cont.PassportIssueOrganization.ToList();

            if(CurrentUser.UserDateOfBirth != null)
            {
                rStatus.Text = "подтверждённая";
                rStatus.Foreground = Brushes.Green;
                tbxSeries.IsReadOnly = tbxNum.IsReadOnly = tbxHouse.IsReadOnly = tbxBuilding.IsReadOnly = tbxApartment.IsReadOnly = true;
                dpDateOfBirth.IsEnabled = dpDateOfIssue.IsEnabled = cbxCity.IsEnabled = cbxOrg.IsEnabled= cbxStreet.IsEnabled = false;
            }
            else
            {
                rStatus.Text = "упрощённая";
                rStatus.Foreground = Brushes.Gray;
            }
        }

        private bool ValidateData()
        {
            if (string.IsNullOrWhiteSpace(tbxPhone.Text))
            {
                tbxPhone.BorderBrush = Brushes.Red;
                return false;
            }
            if (string.IsNullOrWhiteSpace(tbxEmail.Text))
            {
                tbxEmail.BorderBrush = Brushes.Red;
                return false;
            }

            if(string.IsNullOrWhiteSpace(tbxSeries.Text)&&
               string.IsNullOrWhiteSpace(tbxNum.Text) &&
               (dpDateOfIssue.SelectedDate == null) &&
               (cbxOrg.SelectedItem == null) &&
               (dpDateOfIssue.SelectedDate == null) &&
               (cbxCity.SelectedItem == null) &&
               (cbxStreet.SelectedItem == null) &&
               (string.IsNullOrWhiteSpace(tbxHouse.Text)) &&
               (string.IsNullOrWhiteSpace(tbxBuilding.Text)) &&
               (string.IsNullOrWhiteSpace(tbxApartment.Text)))
            {
                return true;
            }

            if(tbxSeries.Text.Length != 4 || !tbxSeries.Text.All(char.IsDigit))
            {
                tbxSeries.BorderBrush = Brushes.Red;
                return false;
            }
            if (tbxNum.Text.Length != 6 || !tbxNum.Text.All(char.IsDigit))
            {
                tbxNum.BorderBrush = Brushes.Red;
                return false;
            }            
            if (dpDateOfIssue.SelectedDate == null)
            {
                dpDateOfIssue.BorderBrush = Brushes.Red;
                return false;
            }
            if(cbxOrg.SelectedItem == null)
            {
                cbxOrg.BorderBrush = Brushes.Red;
                return false;
            }
            if(dpDateOfIssue.SelectedDate == null)
            {
                dpDateOfIssue.BorderBrush = Brushes.Red;
                return false;
            }
            if(cbxCity.SelectedItem == null)
            {
                cbxCity.BorderBrush = Brushes.Red;
                return false;
            }
            if(cbxStreet.SelectedItem == null) 
            {
                cbxStreet.BorderBrush = Brushes.Red;
                return false;
            }
            if (string.IsNullOrWhiteSpace(tbxHouse.Text))
            {
                tbxHouse.BorderBrush = Brushes.Red;
                return false;
            }
            if (string.IsNullOrWhiteSpace(tbxApartment.Text))
            {
                tbxApartment.BorderBrush = Brushes.Red;
                return false;
            }

            CreatePassport();
            return true;
        }

        private void Clear()
        {
            tbxPhone.BorderBrush = tbxEmail.BorderBrush = tbxSeries.BorderBrush = tbxNum.BorderBrush
            = dpDateOfIssue.BorderBrush = cbxOrg.BorderBrush = dpDateOfBirth.BorderBrush = cbxCity.BorderBrush
            = cbxStreet.BorderBrush = tbxHouse.BorderBrush = tbxApartment.BorderBrush = Brushes.Gray;
        }
    }
}

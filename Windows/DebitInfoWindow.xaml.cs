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
using System.Windows.Shapes;
using MoneyInEveryPocket.DatabaseModel;
using static MoneyInEveryPocket.DatabaseModel.AppConnect;
using Calculators;

namespace MoneyInEveryPocket.Windows
{
    /// <summary>
    /// Interaction logic for DebitInfoWindow.xaml
    /// </summary>
    public partial class DebitInfoWindow : Window
    {
        Debit currentDebit;

        public DebitInfoWindow(Debit debit)
        {
            InitializeComponent();
            currentDebit = debit;
            DataContext = currentDebit;
        }

        private void SumValue_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (SumValue.Text != "" && TimeValue.Text != "")
            {
                var Time = Convert.ToInt32(TimeValue.Text);
                var Sum = Convert.ToInt32(SumValue.Text);
                var ServiceCost = (double)currentDebit.DebitServiceCost;
                var BalancePercent = (double)currentDebit.DebitBalancePercent;
                var Cashback = (double)currentDebit.DebitCashback;

                var result = DebitCalculator.CalculateDebit(Time, Sum, ServiceCost, BalancePercent, Cashback);

                tbResult.Text = result;
            }
        }

        private void btnCreateCard_Click(object sender, RoutedEventArgs e)
        {
            // Make sure that all ok
            var res = MessageBox.Show($"Вы действительно хотите оформить дебетовую карту на срок {TimeValue.Text} лет?",
                "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (res == MessageBoxResult.No)
                return;

            // Create new debit account
            var newAccount = new Account()
            {
                AccountType = 2, // "Дебетовый"
                AccountBalance = 0,
                AccountUser = CurrentUser.UserID,
                AccountDateOpen = DateTime.Now.Date
            };
            cont.Account.Add(newAccount);
            cont.SaveChanges();

            // Notice user that all ok
            MessageBox.Show("Дебетовая карта оформлена",
                "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
            Close();
        }
    }
}

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
    /// Interaction logic for CreditInfoWindow.xaml
    /// </summary>
    public partial class CreditInfoWindow : Window
    {
        Credit currentCredit;

        public CreditInfoWindow(Credit credit)
        {
            InitializeComponent();
            currentCredit = credit;
            DataContext = currentCredit;
        }


        private void SumValue_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (SumValue.Text != "" && TimeValue.Text != "")
            {
                var Limit = Convert.ToDouble(SumValue.Text);
                var Time = Convert.ToInt32(TimeValue.Text);
                var Percent = (double)currentCredit.CreditPercent;
                var ServiceCost = (double)currentCredit.CreditServiceCost;

                var result = CreditCalculator.CalculateCredit(Limit, Time, Percent, ServiceCost); 

                tbOverpayment.Text = result.ToString();
                tbTotal.Text = (result + Limit * Time).ToString();
            }
        }

        private void btnCreateCard_Click(object sender, RoutedEventArgs e)
        {
            // Select new credit account balance
            var creditSum = Convert.ToInt32(SumValue.Text);

            // Make sure that all ok
            var res = MessageBox.Show($"Вы действительно хотите оформить кредитную карту с лимитом {creditSum} руб. на срок {TimeValue.Text} лет?",
                "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (res == MessageBoxResult.No)
                return;

            // Create new credit account
            var newAccount = new Account()
            {
                AccountType = 1, // "Кредитный"
                AccountBalance = creditSum,
                AccountUser = CurrentUser.UserID,
                AccountDateOpen = DateTime.Now.Date
            };
            cont.Account.Add(newAccount);
            cont.SaveChanges();

            // Save add operation to history
            var addOperation = new OperationHistory()
            {
                OpType = 2, // "Пополнение"
                OpDate = DateTime.Now.Date,
                OpAmount = creditSum,
                OpAccount = newAccount.AccountNumber
            };
            cont.OperationHistory.Add(addOperation);
            cont.SaveChanges();

            // Notice user that all ok
            MessageBox.Show("Заявка на оформление кредитной карты отправлена. После рассмотрения сотрудником банка во вкладке 'Счета' появится новый кредитный счёт.",
                "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
            Close();
        }

        private void SummaSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (currentCredit == null)
                return;
            if (Convert.ToDouble(SummaSlider.Value) > (double)currentCredit.CreditLimit)
                SummaSlider.Value = (double)currentCredit.CreditLimit;
        }
    }
}

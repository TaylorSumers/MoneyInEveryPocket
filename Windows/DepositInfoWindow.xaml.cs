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
    /// Interaction logic for DepositInfoWindow.xaml
    /// </summary>
    public partial class DepositInfoWindow : Window
    {
        Deposit currentDeposit;

        public DepositInfoWindow(Deposit deposit)
        {
            InitializeComponent();
            currentDeposit = deposit;
            DataContext = currentDeposit;
            if (!currentDeposit.DepositRefillable)
            {
                AdditionSlider.IsEnabled = false;
                AddValue.IsEnabled = false;
            }
            SetAvailibleAccounts();
        }

        private void SumValue_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (SumValue.Text != "" && TimeValue.Text != "" && AddValue.Text != "")
            {
                double Sum = Convert.ToDouble(SumValue.Text);
                int Time = Convert.ToInt32(TimeValue.Text);
                int Add = Convert.ToInt32(AddValue.Text);
                string result = "";

                if(currentDeposit.DepositName == "Стабильный")
                    result = DepositCalculator.CalculateStable(Sum, Time);
                else if(currentDeposit.DepositName == "Оптимальный")
                    result = DepositCalculator.CalculateOptimal(Sum, Time, Add);
                else if(currentDeposit.DepositName == "Стандарт")
                    result = DepositCalculator.CalculateStandart(Sum, Time, Add);

                tbResult.Text = result;
            }
        }

        private void SetAvailibleAccounts()
        {
            var accounts = CurrentUser.Account.Where(account => account.AccountType == 1 || account.AccountType == 2).ToList(); // Search credit or deposit accounts
            if(accounts.Count() == 0) // If not founded, notice user and hide button for make deposit
            {
                tbError.Visibility = Visibility.Visible;
                cbxAccount.IsEnabled = false;
                btnMakeDeposit.Visibility = Visibility.Hidden;
            }
            else // If credit or deposit accounts exist, fill cbx
            {
                cbxAccount.ItemsSource = accounts;
                TimeSlider.Minimum = currentDeposit.DepositMinTerm * 30;
            }
        }

        private void cbxAccount_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(cbxAccount.SelectedItem != null)
                tbBalance.DataContext = cbxAccount.SelectedItem;
        }

        private void btnMakeDeposit_Click(object sender, RoutedEventArgs e)
        {
            // Select account for withdraw money
            var paymentAccount = cbxAccount.SelectedItem as Account;
            if (paymentAccount == null)
            {
                MessageBox.Show("Выберите счёт списания", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Select withdraw and new account balances
            var paymentAccountBalance = paymentAccount.AccountBalance;
            var newAccountBalance = Convert.ToInt32(SumValue.Text);

            // Check conditions
            if (newAccountBalance == 0)
            {
                MessageBox.Show("Нельзя открыть вклад с нулевым балансом", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if(newAccountBalance>paymentAccountBalance)
            {
                MessageBox.Show("Недостаточно средств на счёте списания", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Decrease withdraw account balance
            paymentAccount.AccountBalance = paymentAccountBalance - newAccountBalance;

            // Save decrease operation to history
            var withdrawOperation = new OperationHistory()
            {
                OpType = 1, // "Снятие"
                OpDate = DateTime.Now.Date,
                OpAmount = newAccountBalance,
                OpAccount = paymentAccount.AccountNumber
            };
            cont.OperationHistory.Add(withdrawOperation);

            // Create new deposit account
            var newAccount = new Account()
            {
                AccountType = 3, // "Депозитный"
                AccountBalance = newAccountBalance,
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
                OpAmount = newAccountBalance,
                OpAccount = newAccount.AccountNumber
            };
            cont.OperationHistory.Add(addOperation);
            cont.SaveChanges();

            // Notice user that all ok
            MessageBox.Show("Вклад оформлен", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
            Close();
        }
    }
}


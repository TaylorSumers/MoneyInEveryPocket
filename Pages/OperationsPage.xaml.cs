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
using static MoneyInEveryPocket.DatabaseModel.AppConnect;

namespace MoneyInEveryPocket.Pages
{
    /// <summary>
    /// Interaction logic for OperationsPage.xaml
    /// </summary>

// TODO: Sort operations by date
    public partial class OperationsPage : Page
    {
        public OperationsPage()
        {
            InitializeComponent();

            var UserAccounts  = new List<long>();
            foreach(var account in cont.Account.Where(ac => ac.AccountUser == CurrentUser.UserID))
            {
                UserAccounts.Add(account.AccountNumber);
            }

            if (UserAccounts.Count() != 0)
            {
                var OperationsList = cont.OperationHistory.Where(op => UserAccounts.Contains(op.OpAccount)).ToList();
                LVOperations.ItemsSource = OperationsList;
            }
        }
    }
}

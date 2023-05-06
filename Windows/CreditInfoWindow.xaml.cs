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
        public CreditInfoWindow(Credit credit)
        {
            InitializeComponent();
        }
    }
}

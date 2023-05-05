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
    }
}


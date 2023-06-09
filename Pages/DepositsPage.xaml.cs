﻿using System;
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
using MoneyInEveryPocket.Windows;
using MoneyInEveryPocket.DatabaseModel;

namespace MoneyInEveryPocket.Pages
{
    /// <summary>
    /// Interaction logic for DepositsPage.xaml
    /// </summary>
    public partial class DepositsPage : Page
    {
        public DepositsPage()
        {
            InitializeComponent();

            LVDepos.ItemsSource = cont.Deposit.ToList();
            LVCredits.ItemsSource = cont.Credit.ToList();
            LVDebit.ItemsSource = cont.Debit.ToList();
        }

        private void LVDepos_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            new DepositInfoWindow(LVDepos.SelectedItem as Deposit).ShowDialog();
        }

        private void LVCredits_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            new CreditInfoWindow(LVCredits.SelectedItem as Credit).ShowDialog();
        }

        private void LVDebit_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            new DebitInfoWindow(LVDebit.SelectedItem as Debit).ShowDialog();
        }
    }
}

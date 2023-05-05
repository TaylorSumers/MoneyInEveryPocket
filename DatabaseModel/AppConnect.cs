using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyInEveryPocket.DatabaseModel
{
    internal static class AppConnect
    {
        public static BankEntities cont = new BankEntities();
        public static User CurrentUser;
    }
}

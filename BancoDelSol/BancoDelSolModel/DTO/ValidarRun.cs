using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DTO
{
    public class ValidarRun
    {
        public static bool validarRun(String run)
        {
            bool validacion = false;
            try
            {
                run = run.ToUpper();
                run = run.Replace("-", "");
                int runAux = int.Parse(run.Substring(0, run.Length - 1));

                char dv = char.Parse(run.Substring(run.Length - 1, 1));

                int m = 0, s = 1;
                for(; runAux != 0; runAux /= 10)
                {
                    s = (s + runAux % 10 * (9 - m++ % 6)) % 11;
                }
                if(dv == (char) (s != 0 ? s + 47 : 75))
                {
                    validacion = true;
                }
            }catch(Exception e)
            {
            }
            return validacion;
        }
        
    }
}

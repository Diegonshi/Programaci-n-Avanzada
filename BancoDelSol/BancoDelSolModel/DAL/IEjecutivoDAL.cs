using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DAL
{
    public interface IEjecutivoDAL
    {
        List<Ejecutivo> Obtener();
        void Agregar(Ejecutivo ejecutivo);
    }
}

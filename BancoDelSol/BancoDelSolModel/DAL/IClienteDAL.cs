using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BancoDelSolModel.DAL
{
    public interface IClienteDAL
    {
        List<Cliente> Obtener();
        void Agregar(Cliente cliente);
        List<Cliente> Clientesfiltrados(String run);
    }
}

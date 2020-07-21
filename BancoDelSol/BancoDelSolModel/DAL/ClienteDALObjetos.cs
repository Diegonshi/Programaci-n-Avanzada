using BancoDelSolModel.DTO;
using System;
using System.Collections.Generic;

namespace BancoDelSolModel.DAL
{
    public class ClienteDALObjetos : IClienteDAL
    {
        private IEjecutivoDAL ejecutivoDAL = new EjecutivoDALObjetos();
        private static List<Cliente> clientes = new List<Cliente>();

        public void Agregar(Cliente cliente)
        {
            clientes.Add(cliente);
        }

        public List<Cliente> Obtener()
        {
            return clientes;
        }

        public List<Cliente> Clientesfiltrados(String run)
        {
            List<Ejecutivo> allEjecutivos = ejecutivoDAL.Obtener();
            List<Cliente> allClientes = this.Obtener();
            List<Cliente> listaClientes = new List<Cliente>();

            foreach (Ejecutivo e in allEjecutivos)
            {
                if (e.Run == run)
                {
                    for (int i = 0; i < e.Clientes.Count; i++)
                    {
                      
                           
                                listaClientes.Add(e.Clientes[i]);
                            
                        

                    }
                }
                
            }
            return listaClientes;
        }

    }
}

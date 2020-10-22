using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace COM580Assignment1
{
    class Program
    {
        static void Main(string[] args)
        {
            Menu();
        }
        private static void Menu()
        {
            int menuSelection = -1;
            while (menuSelection != 0)
            {
                Console.Clear();
                Console.WriteLine("Welcome to clinic system\n" +
                    "Please select from one of the following options:\n" +
                    "\t1)List all parents and their details.\n" +
                    "\t2)List all registered children and their details\n" +
                    "\t3)Enter a child Id to view their info and history\n" +
                    "\t4)Enter a Consultant Id and date to view appointments on that date.\n" +
                    "\t5)Enter a Child Id to know the cost of their most recent visit.\n" +
                    "\n\tPress 0 to Exit");
                try
                {
                    menuSelection = Convert.ToInt32(Console.ReadLine());
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message + "\nfSelection not recognised");
                }

                switch (menuSelection)
                {
                    case 0:
                        break;
                    case 1:
                        Console.Clear();
                        ListParents();
                        break;
                    case 2:
                        Console.Clear();
                        ListChildren();
                        break;
                    case 3:
                        long ChildId = 0;
                        bool validId = false;
                        while (!validId && (ChildId == 0))
                        {
                            Console.WriteLine("Input Child Id: ");
                            try
                            {
                                ChildId = Convert.ToInt64(Console.ReadLine());
                                validId = true;
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("Error: " + ex.Message + "\n\nId invalid\nPress enter to try again");
                                Console.ReadLine();
                            }
                        }
                        Console.Clear();
                        ChildVisits(ChildId);
                        break;
                    case 4:
                        long ConsultId = 0;
                        bool validConsId = false;
                        DateTime dateToView = DateTime.Now;
                        while (!validConsId && (ConsultId == 0))
                        {

                            try
                            {
                                Console.WriteLine("Input Consultant Id: ");
                                ConsultId = Convert.ToInt64(Console.ReadLine());
                                validConsId = true;
                                Console.WriteLine("Input date to view appointments");
                                dateToView = Convert.ToDateTime(Console.ReadLine());

                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("Error: " + ex.Message + "\n\nId invalid\nPress enter to try again");
                                Console.ReadLine();
                            }
                        }
                        Console.Clear();
                        ConsultantSchedule(ConsultId, dateToView);
                        break;
                    case 5:
                        long Id = 0;
                        bool valId = false;
                        while (!valId && (Id == 0))
                        {
                            Console.WriteLine("Input Child Id: ");
                            try
                            {
                                Id = Convert.ToInt64(Console.ReadLine());
                                valId = true;
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("Error: " + ex.Message + "\n\nId invalid\nPress enter to try again");
                                Console.ReadLine();
                            }
                        }
                        Console.Clear();
                        VisitCost(Id);
                        break;
                    default:
                        Console.WriteLine("Please make a valid selection");
                        Console.ReadLine();
                        Console.Clear();
                        break;
                }
            }
        }
        private static void ListParents()
        {
            using (ClinicModelContainer db = new ClinicModelContainer())
            {
                foreach (var parent in db.Parents)
                {
                    Console.WriteLine("Name: {0} {1}\n" +
                        "Address: {2}\n" +
                        "Contact Number: {3}\n" +
                        "Email Addresss: {4}\n",
                        parent.FName, parent.SName, parent.Address, parent.ContactNum, parent.Email);
                }
            }
            Console.WriteLine("Press Enter to Return to Menu");
            Console.ReadLine();
            Console.Clear();
        }
        private static void ListChildren()
        {
            using (ClinicModelContainer db = new ClinicModelContainer())
            {
                foreach (var child in db.Children)
                {
                    Console.WriteLine("ChildId: {0}\n" +
                        "Name: {1} {2}\n" +
                        "Gender: {3}\n" +
                        "Date of Birth: {4}\n" +
                        "Parent: {5} {6}\n",
                        child.ChildId, child.FName, child.SName, child.Sex, child.DoB, child.Parent.FName, child.Parent.SName);
                }
            }
            Console.WriteLine("Press Enter to Continue");
            Console.ReadLine();
            Console.Clear();
        }
        private static void ChildVisits(long Id)
        {
            using (ClinicModelContainer db = new ClinicModelContainer())
            {
                IEnumerable<Child> chosenChild = from child in db.Children
                                                 where child.ChildId == Id
                                                 select child;
                IEnumerable<Appointment> Appoints = from apointments in db.Appointments
                                                    where apointments.ChildChildId == Id
                                                    select apointments;
                Appoints = Appoints.OrderByDescending(a => a.Date.Year).ThenByDescending(a => a.Date.Month).ToList<Appointment>();
                foreach (var child in chosenChild)
                {
                    Appoints = child.Appointments;
                    int Age;
                    Age = DateTime.Now.Date.Year - Convert.ToDateTime(child.DoB).Year;
                    Console.WriteLine("Child Name: {0} {1}\n" +
                        "Child Age: {2}\n" +
                        "Child Gender: {3}", child.FName, child.SName, Age, child.Sex);
                }
                Console.WriteLine("\nAppointments");
                foreach (var appointment in Appoints)
                {
                    Console.WriteLine("\nDate: {0}\n" +
                        "Reason: {1}", appointment.Date, appointment.Reason);
                }
                Console.ReadLine();
            }
        }
        private static void ConsultantSchedule(long ConsultantId, DateTime date)
        {
            string dateOnly = date.ToShortDateString();
            using (ClinicModelContainer db = new ClinicModelContainer())
            {
                IEnumerable<Consultant> selectedConsultant = from c in db.Consultants
                                                             where c.ConsultantId == ConsultantId
                                                             select c;
                IEnumerable<Appointment> appointments = from a in db.Appointments
                                                        where a.ConsultantConsultantId == ConsultantId
                                                        select a;
                List<Appointment> appDate = new List<Appointment>();
                foreach (var a in appointments)
                {
                    if (a.Date.ToShortDateString() == date.ToShortDateString())
                    {
                        appDate.Add(a);
                    }
                }
                Console.WriteLine("Consultant: Dr.{0} {1}\nAppointments for: {2}\n", selectedConsultant.ElementAt(0).FName, selectedConsultant.ElementAt(0).SName, date.ToShortDateString());
                foreach (var a in appDate)
                {
                    Console.WriteLine("Name: {0} {1}\n" +
                        "Parent: {2} {3}\n", a.Child.FName, a.Child.SName, a.Child.Parent.FName, a.Child.Parent.SName);
                }
            }
            Console.ReadLine();
        }
        private static void VisitCost(long ChildId)
        {
            using (ClinicModelContainer db = new ClinicModelContainer())
            {
                IEnumerable<Appointment> childVisits = from a in db.Appointments
                                                       where a.ChildChildId == ChildId
                                                       orderby a.Date descending
                                                       select a;
                Appointment mostRecent = childVisits.First();
                IEnumerable<Medication> recentApptMeds = from m in db.Medications
                                                         where m.AppointmentAppointmentId == mostRecent.AppointmentId
                                                         select m;
                decimal costAppointment = 60.00M;
                Console.WriteLine("Item\t\tCost");
                Console.WriteLine("Appt. Fee"+ "\t£" + costAppointment);
                foreach (var med in recentApptMeds)
                {
                    Console.WriteLine("{0}\t£{1}",med.Name, med.Cost.ToString());
                    costAppointment += med.Cost;
                }
                Console.WriteLine("\tTotal £{0}", costAppointment);
            }
            Console.ReadLine();
        }
    }
}

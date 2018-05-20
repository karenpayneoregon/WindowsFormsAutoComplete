using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BackEndLibrary;
using Cue_BannerLibrary;

namespace FrontEnd
{
    public partial class MainForm : Form
    {
        // ReSharper disable once InconsistentNaming
        public BindingSource bs { get; } = new BindingSource();

        public MainForm()
        {
            InitializeComponent();
            Shown += MainForm_Shown;
        }

        private void MainForm_Shown(object sender, EventArgs e)
        {
            /*
             * Setup ComboBox to use the items in the DataSource
             * as the autocomplete items.
             */
            cboDepartments.AutoCompleteMode = AutoCompleteMode.Suggest;
            cboDepartments.AutoCompleteSource = AutoCompleteSource.ListItems;

            /*
             * Returns all departments
             */
            var ops = new AutoCompleteOperations();
            bs.DataSource = ops.Deparments();

            cboDepartments.DataSource = bs;

            /*
             * key   - deparment name
             * value - deparment identifier
             */
            cboDepartments.DisplayMember = "key";
            cboDepartments.ValueMember = "value";

            /*
             * Get gender types into the gender ComboBox
             */
            cboGender.DataSource = ops.Genders();

            txtFirstName.SetCueText("Enter first name");
            txtLastName.SetCueText("Enter last name");
            cboDepartments.SetCueText("Select a department");

            /*
             * Test if there were any exceptions while reading in data.
             */
            if (ops.HasException)
            {
                cmdAddPatient.Enabled = false;
                MessageBox.Show($"Encountered issues reading data{Environment.NewLine}{ops.LastExceptionMessage}");
            }

        }
        private void cmdAddPatient_Click(object sender, EventArgs e)
        {
            // validate all information has been entered
            if (string.IsNullOrWhiteSpace(txtFirstName.Text) || string.IsNullOrWhiteSpace(txtLastName.Text) || cboDepartments.SelectedItem == null)
            {
                MessageBox.Show("Please make sure first and last name have values and a valid department has been selected");
                return;
            }

            /*
             * Get selected department from ComboBox
             */
            var department = (KeyValuePair<string, int>) cboDepartments.SelectedItem;

            // get selected gender primary key
            var genderIdentifier = ((Gender)cboGender.SelectedItem).Identifier;

            var ops = new AutoCompleteOperations();
            var p = new Patient()
            {
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                GenderIdentifier = genderIdentifier,
                DepartmentIdentifier = department.Value
            };

            /*
             * On success of adding a patient return the new primary key
             */
            if (ops.AddPatient(p))
            {
                dgvPatients.Rows.Add(p.Id, p.FirstName, p.LastName, p.GenderIdentifier, p.DepartmentIdentifier);
            }
            else
            {
                MessageBox.Show(ops.LastExceptionMessage);
            }
        }
    }
}

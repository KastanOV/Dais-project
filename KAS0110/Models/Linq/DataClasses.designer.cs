﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KAS0110.Models.Linq
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="Pneuservis")]
	public partial class DataClassesDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertContract(Contract instance);
    partial void UpdateContract(Contract instance);
    partial void DeleteContract(Contract instance);
    partial void InsertCustomer(Customer instance);
    partial void UpdateCustomer(Customer instance);
    partial void DeleteCustomer(Customer instance);
    partial void InsertWorkItemsReady(WorkItemsReady instance);
    partial void UpdateWorkItemsReady(WorkItemsReady instance);
    partial void DeleteWorkItemsReady(WorkItemsReady instance);
    #endregion
		
		public DataClassesDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["PneuservisConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DataClassesDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClassesDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClassesDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DataClassesDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Contract> Contracts
		{
			get
			{
				return this.GetTable<Contract>();
			}
		}
		
		public System.Data.Linq.Table<Customer> Customers
		{
			get
			{
				return this.GetTable<Customer>();
			}
		}
		
		public System.Data.Linq.Table<WorkItemsReady> WorkItemsReadies
		{
			get
			{
				return this.GetTable<WorkItemsReady>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Contract")]
	public partial class Contract : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private int _Customers_id;
		
		private int _Employees_id;
		
		private System.DateTime _CustomerArrival;
		
		private short _GarageNumber;
		
		private System.Nullable<System.DateTime> _CustomerExit;
		
		private System.Nullable<int> _Payment;
		
		private System.Nullable<bool> _VAT;
		
		private EntityRef<Customer> _Customer;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnCustomers_idChanging(int value);
    partial void OnCustomers_idChanged();
    partial void OnEmployees_idChanging(int value);
    partial void OnEmployees_idChanged();
    partial void OnCustomerArrivalChanging(System.DateTime value);
    partial void OnCustomerArrivalChanged();
    partial void OnGarageNumberChanging(short value);
    partial void OnGarageNumberChanged();
    partial void OnCustomerExitChanging(System.Nullable<System.DateTime> value);
    partial void OnCustomerExitChanged();
    partial void OnPaymentChanging(System.Nullable<int> value);
    partial void OnPaymentChanged();
    partial void OnVATChanging(System.Nullable<bool> value);
    partial void OnVATChanged();
    #endregion
		
		public Contract()
		{
			this._Customer = default(EntityRef<Customer>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Customers_id", DbType="Int NOT NULL")]
		public int Customers_id
		{
			get
			{
				return this._Customers_id;
			}
			set
			{
				if ((this._Customers_id != value))
				{
					if (this._Customer.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnCustomers_idChanging(value);
					this.SendPropertyChanging();
					this._Customers_id = value;
					this.SendPropertyChanged("Customers_id");
					this.OnCustomers_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Employees_id", DbType="Int NOT NULL")]
		public int Employees_id
		{
			get
			{
				return this._Employees_id;
			}
			set
			{
				if ((this._Employees_id != value))
				{
					this.OnEmployees_idChanging(value);
					this.SendPropertyChanging();
					this._Employees_id = value;
					this.SendPropertyChanged("Employees_id");
					this.OnEmployees_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CustomerArrival", DbType="DateTime NOT NULL")]
		public System.DateTime CustomerArrival
		{
			get
			{
				return this._CustomerArrival;
			}
			set
			{
				if ((this._CustomerArrival != value))
				{
					this.OnCustomerArrivalChanging(value);
					this.SendPropertyChanging();
					this._CustomerArrival = value;
					this.SendPropertyChanged("CustomerArrival");
					this.OnCustomerArrivalChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GarageNumber", DbType="SmallInt NOT NULL")]
		public short GarageNumber
		{
			get
			{
				return this._GarageNumber;
			}
			set
			{
				if ((this._GarageNumber != value))
				{
					this.OnGarageNumberChanging(value);
					this.SendPropertyChanging();
					this._GarageNumber = value;
					this.SendPropertyChanged("GarageNumber");
					this.OnGarageNumberChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CustomerExit", DbType="DateTime")]
		public System.Nullable<System.DateTime> CustomerExit
		{
			get
			{
				return this._CustomerExit;
			}
			set
			{
				if ((this._CustomerExit != value))
				{
					this.OnCustomerExitChanging(value);
					this.SendPropertyChanging();
					this._CustomerExit = value;
					this.SendPropertyChanged("CustomerExit");
					this.OnCustomerExitChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Payment", DbType="Int")]
		public System.Nullable<int> Payment
		{
			get
			{
				return this._Payment;
			}
			set
			{
				if ((this._Payment != value))
				{
					this.OnPaymentChanging(value);
					this.SendPropertyChanging();
					this._Payment = value;
					this.SendPropertyChanged("Payment");
					this.OnPaymentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VAT", DbType="Bit")]
		public System.Nullable<bool> VAT
		{
			get
			{
				return this._VAT;
			}
			set
			{
				if ((this._VAT != value))
				{
					this.OnVATChanging(value);
					this.SendPropertyChanging();
					this._VAT = value;
					this.SendPropertyChanged("VAT");
					this.OnVATChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Customer_Contract", Storage="_Customer", ThisKey="Customers_id", OtherKey="id", IsForeignKey=true)]
		public Customer Customer
		{
			get
			{
				return this._Customer.Entity;
			}
			set
			{
				Customer previousValue = this._Customer.Entity;
				if (((previousValue != value) 
							|| (this._Customer.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Customer.Entity = null;
						previousValue.Contracts.Remove(this);
					}
					this._Customer.Entity = value;
					if ((value != null))
					{
						value.Contracts.Add(this);
						this._Customers_id = value.id;
					}
					else
					{
						this._Customers_id = default(int);
					}
					this.SendPropertyChanged("Customer");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Customers")]
	public partial class Customer : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _email;
		
		private string _fname;
		
		private string _lname;
		
		private string _phone;
		
		private string _adress;
		
		private string _city;
		
		private int _postalCode;
		
		private string _CompanyName;
		
		private string _ICO;
		
		private string _DIC;
		
		private EntitySet<Contract> _Contracts;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnemailChanging(string value);
    partial void OnemailChanged();
    partial void OnfnameChanging(string value);
    partial void OnfnameChanged();
    partial void OnlnameChanging(string value);
    partial void OnlnameChanged();
    partial void OnphoneChanging(string value);
    partial void OnphoneChanged();
    partial void OnadressChanging(string value);
    partial void OnadressChanged();
    partial void OncityChanging(string value);
    partial void OncityChanged();
    partial void OnpostalCodeChanging(int value);
    partial void OnpostalCodeChanged();
    partial void OnCompanyNameChanging(string value);
    partial void OnCompanyNameChanged();
    partial void OnICOChanging(string value);
    partial void OnICOChanged();
    partial void OnDICChanging(string value);
    partial void OnDICChanged();
    #endregion
		
		public Customer()
		{
			this._Contracts = new EntitySet<Contract>(new Action<Contract>(this.attach_Contracts), new Action<Contract>(this.detach_Contracts));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_email", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string email
		{
			get
			{
				return this._email;
			}
			set
			{
				if ((this._email != value))
				{
					this.OnemailChanging(value);
					this.SendPropertyChanging();
					this._email = value;
					this.SendPropertyChanged("email");
					this.OnemailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_fname", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string fname
		{
			get
			{
				return this._fname;
			}
			set
			{
				if ((this._fname != value))
				{
					this.OnfnameChanging(value);
					this.SendPropertyChanging();
					this._fname = value;
					this.SendPropertyChanged("fname");
					this.OnfnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_lname", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string lname
		{
			get
			{
				return this._lname;
			}
			set
			{
				if ((this._lname != value))
				{
					this.OnlnameChanging(value);
					this.SendPropertyChanging();
					this._lname = value;
					this.SendPropertyChanged("lname");
					this.OnlnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_phone", DbType="VarChar(15) NOT NULL", CanBeNull=false)]
		public string phone
		{
			get
			{
				return this._phone;
			}
			set
			{
				if ((this._phone != value))
				{
					this.OnphoneChanging(value);
					this.SendPropertyChanging();
					this._phone = value;
					this.SendPropertyChanged("phone");
					this.OnphoneChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_adress", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string adress
		{
			get
			{
				return this._adress;
			}
			set
			{
				if ((this._adress != value))
				{
					this.OnadressChanging(value);
					this.SendPropertyChanging();
					this._adress = value;
					this.SendPropertyChanged("adress");
					this.OnadressChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_city", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string city
		{
			get
			{
				return this._city;
			}
			set
			{
				if ((this._city != value))
				{
					this.OncityChanging(value);
					this.SendPropertyChanging();
					this._city = value;
					this.SendPropertyChanged("city");
					this.OncityChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_postalCode", DbType="Int NOT NULL")]
		public int postalCode
		{
			get
			{
				return this._postalCode;
			}
			set
			{
				if ((this._postalCode != value))
				{
					this.OnpostalCodeChanging(value);
					this.SendPropertyChanging();
					this._postalCode = value;
					this.SendPropertyChanged("postalCode");
					this.OnpostalCodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CompanyName", DbType="VarChar(50)")]
		public string CompanyName
		{
			get
			{
				return this._CompanyName;
			}
			set
			{
				if ((this._CompanyName != value))
				{
					this.OnCompanyNameChanging(value);
					this.SendPropertyChanging();
					this._CompanyName = value;
					this.SendPropertyChanged("CompanyName");
					this.OnCompanyNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ICO", DbType="VarChar(10)")]
		public string ICO
		{
			get
			{
				return this._ICO;
			}
			set
			{
				if ((this._ICO != value))
				{
					this.OnICOChanging(value);
					this.SendPropertyChanging();
					this._ICO = value;
					this.SendPropertyChanged("ICO");
					this.OnICOChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DIC", DbType="VarChar(12)")]
		public string DIC
		{
			get
			{
				return this._DIC;
			}
			set
			{
				if ((this._DIC != value))
				{
					this.OnDICChanging(value);
					this.SendPropertyChanging();
					this._DIC = value;
					this.SendPropertyChanged("DIC");
					this.OnDICChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Customer_Contract", Storage="_Contracts", ThisKey="id", OtherKey="Customers_id")]
		public EntitySet<Contract> Contracts
		{
			get
			{
				return this._Contracts;
			}
			set
			{
				this._Contracts.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Contracts(Contract entity)
		{
			this.SendPropertyChanging();
			entity.Customer = this;
		}
		
		private void detach_Contracts(Contract entity)
		{
			this.SendPropertyChanging();
			entity.Customer = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.WorkItemsReady")]
	public partial class WorkItemsReady : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _Name;
		
		private string _Description;
		
		private int _Price;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    partial void OnPriceChanging(int value);
    partial void OnPriceChanged();
    #endregion
		
		public WorkItemsReady()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string Name
		{
			get
			{
				return this._Name;
			}
			set
			{
				if ((this._Name != value))
				{
					this.OnNameChanging(value);
					this.SendPropertyChanging();
					this._Name = value;
					this.SendPropertyChanged("Name");
					this.OnNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="VarChar(200) NOT NULL", CanBeNull=false)]
		public string Description
		{
			get
			{
				return this._Description;
			}
			set
			{
				if ((this._Description != value))
				{
					this.OnDescriptionChanging(value);
					this.SendPropertyChanging();
					this._Description = value;
					this.SendPropertyChanged("Description");
					this.OnDescriptionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Price", DbType="Int NOT NULL")]
		public int Price
		{
			get
			{
				return this._Price;
			}
			set
			{
				if ((this._Price != value))
				{
					this.OnPriceChanging(value);
					this.SendPropertyChanging();
					this._Price = value;
					this.SendPropertyChanged("Price");
					this.OnPriceChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
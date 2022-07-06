// ShowParamsForm.h
#pragma once

namespace ShowParams2 {

  using namespace System;
  using namespace System::Windows::Forms;

  public ref class Form1 : public System::Windows::Forms::Form
  {
  public:
  private:
    array<System::String ^> ^args;
  public:
    Form1(array<System::String ^> ^_args) : args(_args)
    {
      InitializeComponent();
    }

  protected:
    ~Form1()
    {
      if (components)
      {
        delete components;
      }
    }
  private: System::Windows::Forms::TextBox^  textBox1;
  protected: 

  private:
    System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
    void InitializeComponent(void)
    {
      this->textBox1 = (gcnew System::Windows::Forms::TextBox());
      this->SuspendLayout();
      // 
      // textBox1
      // 
      this->textBox1->Anchor = static_cast<System::Windows::Forms::AnchorStyles>((((System::Windows::Forms::AnchorStyles::Top | System::Windows::Forms::AnchorStyles::Bottom) 
        | System::Windows::Forms::AnchorStyles::Left) 
        | System::Windows::Forms::AnchorStyles::Right));
      this->textBox1->Location = System::Drawing::Point(12, 12);
      this->textBox1->Multiline = true;
      this->textBox1->Name = L"textBox1";
      this->textBox1->Size = System::Drawing::Size(260, 238);
      this->textBox1->TabIndex = 0;
      // 
      // Form1
      // 
      this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
      this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
      this->ClientSize = System::Drawing::Size(284, 262);
      this->Controls->Add(this->textBox1);
      this->Name = L"Form1";
      this->Text = L"Form1";
      this->Load += gcnew System::EventHandler(this, &Form1::Form1_Load);
      this->ResumeLayout(false);
      this->PerformLayout();

    }
#pragma endregion
  private: System::Void Form1_Load(System::Object^  sender, System::EventArgs^  e) {
      int i = 0;
      for each(String^ arg in args)
      {
        textBox1->AppendText("arg[" + i + "]=" + arg + Environment::NewLine);
        i++;
      }
    }

  };
}
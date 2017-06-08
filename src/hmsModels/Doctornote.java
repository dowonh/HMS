package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Doctornote implements Serializable {

   private int dnid;
   private String symptom;
   private String diease;
   private String note;
   private String day;
   private int patient_pid;
   Patient patient;
   
   public Doctornote(){}

   public String toJson(){
      return HmsFactory.toJson(this);
   }

   public int getDnid() {
      return dnid;
   }

   public void setDnid(int dnid) {
      this.dnid = dnid;
   }

   public String getSymptom() {
      return symptom;
   }

   public void setSymptom(String symptom) {
      this.symptom = symptom;
   }

   public String getDiease() {
      return diease;
   }

   public void setDiease(String diease) {
      this.diease = diease;
   }

   public String getNote() {
      return note;
   }

   public void setNote(String note) {
      this.note = note;
   }

   public String getDay() {
      return day;
   }

   public void setDay(String day) {
      this.day = day;
   }

   public int getPatient_pid() {
      return patient_pid;
   }

   public void setPatient_pid(int patient_pid) {
      this.patient_pid = patient_pid;
   }

   public Patient getPatient() {
      return patient;
   }

   public void setPatient(Patient patient) {
      this.patient = patient;
   }
   
}
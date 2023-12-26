package com.daowen.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;
@Entity
public class Kecheng
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
  }
   private String keshi ;
   public String getKeshi() 
   {
      return keshi;
  }
   public void setKeshi(String keshi) 
   {
      this.keshi= keshi;
  }
   private String tupian ;
   public String getTupian() 
   {
      return tupian;
  }
   public void setTupian(String tupian) 
   {
      this.tupian= tupian;
  }
   private String skshijian ;
   public String getSkshijian() 
   {
      return skshijian;
  }
   public void setSkshijian(String skshijian) 
   {
      this.skshijian= skshijian;
  }
   private int fee ;
   public int getFee() 
   {
      return fee;
  }
   public void setFee(int fee) 
   {
      this.fee= fee;
  }
   private Date createtime ;
   public Date getCreatetime() 
   {
      return createtime;
  }
   public void setCreatetime(Date createtime) 
   {
      this.createtime= createtime;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
   private String tno ;
   public String getTno() 
   {
      return tno;
  }
   public void setTno(String tno) 
   {
      this.tno= tno;
  }
   private String tname ;
   public String getTname() 
   {
      return tname;
  }
   public void setTname(String tname) 
   {
      this.tname= tname;
  }
}

package Entidad;
// Generated 12-jul-2016 17:53:12 by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Login generated by hbm2java
 */
public class Login  implements java.io.Serializable {


     private BigDecimal idLogin;
     private BigDecimal rutusuario;
     private BigDecimal idTipousuario;
     private String clave;

    public Login() {
    }

    public Login(BigDecimal idLogin, BigDecimal rutusuario, BigDecimal idTipousuario, String clave) {
       this.idLogin = idLogin;
       this.rutusuario = rutusuario;
       this.idTipousuario = idTipousuario;
       this.clave = clave;
    }
   
    public BigDecimal getIdLogin() {
        return this.idLogin;
    }
    
    public void setIdLogin(BigDecimal idLogin) {
        this.idLogin = idLogin;
    }
    public BigDecimal getRutusuario() {
        return this.rutusuario;
    }
    
    public void setRutusuario(BigDecimal rutusuario) {
        this.rutusuario = rutusuario;
    }
    public BigDecimal getIdTipousuario() {
        return this.idTipousuario;
    }
    
    public void setIdTipousuario(BigDecimal idTipousuario) {
        this.idTipousuario = idTipousuario;
    }
    public String getClave() {
        return this.clave;
    }
    
    public void setClave(String clave) {
        this.clave = clave;
    }




}



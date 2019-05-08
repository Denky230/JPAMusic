/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author alu2017310
 */
@Entity
@Table(name = "sheetmusic")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sheetmusic.findAll", query = "SELECT s FROM Sheetmusic s")
    , @NamedQuery(name = "Sheetmusic.findByIdsheetmusic", query = "SELECT s FROM Sheetmusic s WHERE s.idsheetmusic = :idsheetmusic")
    , @NamedQuery(name = "Sheetmusic.findByTitle", query = "SELECT s FROM Sheetmusic s WHERE s.title = :title")
    , @NamedQuery(name = "Sheetmusic.findByArtist", query = "SELECT s FROM Sheetmusic s WHERE s.artist = :artist")
    , @NamedQuery(name = "Sheetmusic.findByInstrument", query = "SELECT s FROM Sheetmusic s WHERE s.instrument = :instrument")
    , @NamedQuery(name = "Sheetmusic.findByGenre", query = "SELECT s FROM Sheetmusic s WHERE s.genre = :genre")
    , @NamedQuery(name = "Sheetmusic.findByDifficulty", query = "SELECT s FROM Sheetmusic s WHERE s.difficulty = :difficulty")
    , @NamedQuery(name = "Sheetmusic.findByPrinted", query = "SELECT s FROM Sheetmusic s WHERE s.printed = :printed")})
public class Sheetmusic implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idsheetmusic")
    private Integer idsheetmusic;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "title")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 90)
    @Column(name = "artist")
    private String artist;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "instrument")
    private String instrument;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "genre")
    private String genre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "difficulty")
    private String difficulty;
    @Basic(optional = false)
    @NotNull
    @Column(name = "printed")
    private boolean printed;
    @JoinColumn(name = "owner", referencedColumnName = "username")
    @ManyToOne(optional = false)
    private User owner;

    public Sheetmusic() {
    }
    public Sheetmusic(Integer idsheetmusic) {
        this.idsheetmusic = idsheetmusic;
    }
    public Sheetmusic(Integer idsheetmusic, String title, String artist, String instrument, String genre, String difficulty, boolean printed) {
        this.idsheetmusic = idsheetmusic;
        this.title = title;
        this.artist = artist;
        this.instrument = instrument;
        this.genre = genre;
        this.difficulty = difficulty;
        this.printed = printed;
    }

    public Integer getIdsheetmusic() {
        return idsheetmusic;
    }
    public void setIdsheetmusic(Integer idsheetmusic) {
        this.idsheetmusic = idsheetmusic;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }
    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getInstrument() {
        return instrument;
    }
    public void setInstrument(String instrument) {
        this.instrument = instrument;
    }

    public String getGenre() {
        return genre;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDifficulty() {
        return difficulty;
    }
    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public boolean getPrinted() {
        return printed;
    }
    public void setPrinted(boolean printed) {
        this.printed = printed;
    }

    public User getOwner() {
        return owner;
    }
    public void setOwner(User owner) {
        this.owner = owner;
    }

    @Override public int hashCode() {
        int hash = 0;
        hash += (idsheetmusic != null ? idsheetmusic.hashCode() : 0);
        return hash;
    }
    @Override public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sheetmusic)) {
            return false;
        }
        Sheetmusic other = (Sheetmusic) object;
        if ((this.idsheetmusic == null && other.idsheetmusic != null) || (this.idsheetmusic != null && !this.idsheetmusic.equals(other.idsheetmusic))) {
            return false;
        }
        return true;
    }

    @Override public String toString() {
        return "entities.Sheetmusic[ idsheetmusic=" + idsheetmusic + " ]";
    }
}
package com.rev.pubhub.model;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "books")
public class Book {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Long id;
	@Column(name = "NAME")
	private String name;
	@Column(name = "price")
	private Integer price;
	@Column(name = "released_date")
	private LocalDate releasedOn;

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", price=" + price + ", released_on=" + releasedOn + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public LocalDate getReleasedOn() {
		return releasedOn;
	}

	public void setReleased_on(LocalDate releasedOn) {
		this.releasedOn = releasedOn;
	}

}

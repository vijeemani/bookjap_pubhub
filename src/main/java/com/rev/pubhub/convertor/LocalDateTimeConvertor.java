package com.rev.pubhub.convertor;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter(autoApply = true)
public class LocalDateTimeConvertor implements AttributeConverter<LocalDateTime, Timestamp> {

	@Override
	public Timestamp convertToDatabaseColumn(LocalDateTime locDate) {
		return (locDate == null ? null : Timestamp.valueOf(locDate));
	}

	@Override
	public LocalDateTime convertToEntityAttribute(Timestamp sqlDate) {
		return (sqlDate == null ? null : sqlDate.toLocalDateTime());
	}
}
package com.somplace.domain.command;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class MemberCommand {
	
	@NotEmpty
	@Size(min = 4, max = 16)
	private String memberId;
	
	@NotEmpty
	@Size(min = 4, max = 16)
	private String pw;
	
	@NotEmpty
	@Size(min = 4, max = 16)
	private String pwConfirm;
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	@Size(min = 8, max = 8)
	private String studentNumber;
	
	@NotEmpty(message = "전공을 선택해주세요.")
	private String major;
	
	@NotEmpty
	@Pattern(regexp = "^010([0-9]{8})$")
	private String phone;
	
	@NotEmpty
	private String birth;
	
	private int studentNumberIntType;

	public MemberCommand() {
		super();
	}

	public MemberCommand(@NotEmpty @Size(min = 4, max = 16) String memberId,
			@NotEmpty @Size(min = 4, max = 16) String pw, @NotEmpty @Size(min = 4, max = 16) String pwConfirm,
			@NotEmpty String name, @NotEmpty @Size(min = 8, max = 8) String studentNumber,
			@NotEmpty(message = "전공을 선택해주세요.") String major,
			@NotEmpty @Pattern(regexp = "^010([0-9]{8})$", message = "전화번호 형식이 틀렸습니다") String phone,
			@NotEmpty String birth) {
		super();
		this.memberId = memberId;
		this.pw = pw;
		this.pwConfirm = pwConfirm;
		this.name = name;
		this.studentNumber = studentNumber;
		this.major = major;
		this.phone = phone;
		this.birth = birth;
	}

}

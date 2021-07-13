package com.office.platform.entity.dao;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zhzhd
 * @date 2019-01-13
 * @despriction back-grount-system
 * Entity - 基类
 */
public abstract class BaseEntity implements Serializable {

	private static final long serialVersionUID = -67188388306700736L;

	/**
	 *  ID
	 */
	private Long id;

	/**
	 * 创建日期
	 */
	private Date createDate = new Date();

	/**
	 * 修改日期
	 */
	private Date modifyDate = new Date();

	/**
	 * 备注
	 */
	private String remark = "";

	/**
	 * 是否有效
	 */
	private Boolean yn = true;

	/**
	 * 扩展字段
	 */
	private Map<String , Object> mapParams = new HashMap<>();

	/**
	 * 获取ID
	 * 
	 * @return ID
	 */
	public Long getId() {
		return id;
	}

	/**
	 * 设置ID
	 * 
	 * @param id
	 *            ID
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 获取创建日期
	 * 
	 * @return 创建日期
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * 设置创建日期
	 * 
	 * @param createDate
	 *            创建日期
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * 获取修改日期
	 * 
	 * @return 修改日期
	 */
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	 * 设置修改日期
	 * 
	 * @param modifyDate
	 *            修改日期
	 */
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Map<String, Object> getMapParams() {
		return mapParams;
	}

	public void setMapParams(Map<String, Object> mapParams) {
		this.mapParams = mapParams;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Boolean getYn() {
		return yn;
	}

	public void setYn(Boolean yn) {
		this.yn = yn;
	}

	/**
	 * 重写equals方法
	 * 
	 * @param obj
	 *            对象
	 * @return 是否相等
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (this == obj) {
			return true;
		}
		if (!BaseEntity.class.isAssignableFrom(obj.getClass())) {
			return false;
		}
		BaseEntity other = (BaseEntity) obj;
		return getId() != null && getId().equals(other.getId());
	}

	/**
	 * 重写hashCode方法
	 * 
	 * @return hashCode
	 */
	@Override
	public int hashCode() {
		int hashCode = 17;
		hashCode += null == getId() ? 0 : getId().hashCode() * 31;
		return hashCode;
	}

}
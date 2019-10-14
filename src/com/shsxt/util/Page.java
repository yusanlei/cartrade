package com.shsxt.util;

import java.util.List;

//分页工具类
public class Page<T> {
	private Integer pageNum;// 当前页（前台传递；如果前台没有传递，当前页默认为1）
	private Integer pageSize;// 每页显示的数量（前台传递或后台设置；如果前台未传递，则后台设置默认值，如前台传递，则以前台为准）
	private long totalCount;// 总记录数（数据库查询得到，通过count()函数）

	private Integer startNavPage;// 开始页（当前页-5；如果当前页-5小于1，则导航开始数为1，此时导航结束数为导航开始数+9；如果导航开始数+9大于总页数，此时导航结束数为总页数）
	private Integer endNavPage;// 结束页（当前页+4；如果当前页+4大于总页数，则导航结束数为总页数，此时导航开始数为导航结束数-9；如果导航结束数-9小于1，此时导航开始数为1）
	private Integer totalPages;// 总页数（总记录数/每页显示的数量，向上取整；需要先将数据转成浮点型再相除）
	private Integer prePage;// 上一页（当前页-1；如果当前页-1小于1，则为1；如果当前页-1不小于1，则为当前页-1）
	private Integer nextPage;// 下一页（当前页+1；如果当前页+1大于总页数，则为总页数；如果当前页+1不大于总页数，则当前页+1）
	private List<T> dataList;// 数据分页集合 （数据库中分页查询得到 limit关键字：limit 参数1,参数2
								// 参数1表示当前查询的数据的索引；参数2表示每页想要显示的数量）

	// 构造参数，通过当前页，每页显示数量，总记录数，获取其他参数
	public Page(Integer pageNum, Integer pageSize, long totalCount) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		totalPages = (int) Math.ceil(totalCount * 1.0 / pageSize);
		prePage = pageNum - 1 < 1 ? 1 : pageNum - 1;
		nextPage = pageNum + 1 > totalPages ? totalPages : pageNum + 1;
		startNavPage = pageNum - 5;
		endNavPage = pageNum + 4;
		if (startNavPage < 1) {
			startNavPage = 1;
			endNavPage = startNavPage + 9 > totalPages ? totalPages : startNavPage + 9;
		}
		if (endNavPage > totalPages) {
			endNavPage = totalPages;
			startNavPage = endNavPage - 9 < 1 ? 1 : endNavPage - 9;
		}
	}

	/**
	 * @return the pageNum
	 */
	public Integer getPageNum() {
		return pageNum;
	}

	/**
	 * @param pageNum
	 *            the pageNum to set
	 */
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	/**
	 * @return the pageSize
	 */
	public Integer getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize
	 *            the pageSize to set
	 */
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the totalCount
	 */
	public long getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount
	 *            the totalCount to set
	 */
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @return the startNavPage
	 */
	public Integer getStartNavPage() {
		return startNavPage;
	}

	/**
	 * @param startNavPage
	 *            the startNavPage to set
	 */
	public void setStartNavPage(Integer startNavPage) {
		this.startNavPage = startNavPage;
	}

	/**
	 * @return the endNavPage
	 */
	public Integer getEndNavPage() {
		return endNavPage;
	}

	/**
	 * @param endNavPage
	 *            the endNavPage to set
	 */
	public void setEndNavPage(Integer endNavPage) {
		this.endNavPage = endNavPage;
	}

	/**
	 * @return the totalPages
	 */
	public Integer getTotalPages() {
		return totalPages;
	}

	/**
	 * @param totalPages
	 *            the totalPages to set
	 */
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	/**
	 * @return the prePage
	 */
	public Integer getPrePage() {
		return prePage;
	}

	/**
	 * @param prePage
	 *            the prePage to set
	 */
	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}

	/**
	 * @return the nextPage
	 */
	public Integer getNextPage() {
		return nextPage;
	}

	/**
	 * @param nextPage
	 *            the nextPage to set
	 */
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}

	/**
	 * @return the dataList
	 */
	public List<T> getDataList() {
		return dataList;
	}

	/**
	 * @param dataList
	 *            the dataList to set
	 */
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

}

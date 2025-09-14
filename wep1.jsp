<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>
    <c:choose>
      <c:when test="${not empty article}">
        <c:out value="${article.title}" />
      </c:when>
      <c:otherwise>GameLike</c:otherwise>
    </c:choose>
    - GameLike
  </title>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    /* CSS 생략 (기존 스타일 그대로 사용) */
  </style>
</head>
<body>
  <header class="topbar">
    <div class="container row">
      <div class="logo">YuhanGames<span class="dot">.</span></div>
      <nav class="primary">
        <a href="#">뉴스</a>
        <a href="#">리뷰</a>
        <a href="#">가이드</a>
        <a href="#">인터뷰</a>
        <a href="#">E스포츠</a>
        <a href="#">영상</a>
      </nav>
      <div class="search">
        <form action="/search" method="get">
          <input type="text" name="q" placeholder="게임, 기사 검색" />
        </form>
      </div>
    </div>
  </header>

  <div class="container">
    <c:if test="${not empty article}">
      <div class="breadcrumb">
        <a href="/">홈</a>
        <span>›</span>
        <a href="/category/${article.category}"><c:out value="${article.category}" /></a>
        <c:if test="${not empty article.subcategory}">
          <span>›</span>
          <a href="/category/${article.category}/${article.subcategory}"><c:out value="${article.subcategory}" /></a>
        </c:if>
      </div>

      <div class="layout">
        <main>
          <div style="display:grid;grid-template-columns:42px 1fr;gap:18px;align-items:start">
            <!-- 좌측 공유 버튼 -->
            <div class="share" aria-label="공유 버튼">
              <a href="https://www.facebook.com/sharer/sharer.php?u=${pageContext.request.requestURL}" target="_blank" rel="noopener" title="Facebook 공유">F</a>
              <a href="https://twitter.com/intent/tweet?url=${pageContext.request.requestURL}&text=${fn:escapeXml(article.title)}" target="_blank" rel="noopener" title="X 공유">X</a>
              <a href="mailto:?subject=${fn:escapeXml(article.title)}&body=${pageContext.request.requestURL}" title="메일">@</a>
            </div>

            <!-- 기사 본문 -->
            <section>
              <div style="display:flex;gap:8px;flex-wrap:wrap">
                <span class="chip">Stardew_Valley</span>
                <c:if test="${not empty article.subcategory}">
                  <span class="chip"><c:out value="${article.subcategory}" /></span>
                </c:if>
              </div>

              <h1 class="headline"><c:out value="${article.title}" /></h1>
              <c:if test="${not empty article.subtitle}">
                <p class="subhead"><c:out value="${article.subtitle}" /></p>
              </c:if>

              <div class="meta">
                <span>작성자
                  <c:if test="${not empty article.authorName}">
                    <a href="${article.authorProfileUrl}"><strong><c:out value="${article.authorName}" /></strong></a>
                  </c:if>
                </span>
                <span class="sep">·</span>
                <span>게시 <fmt:formatDate value="${article.publishedAt}" pattern="yyyy.MM.dd HH:mm" /></span>
                <c:if test="${not empty article.updatedAt}">
                  <span class="sep">·</span>
                  <span>수정 <fmt:formatDate value="${article.updatedAt}" pattern="yyyy.MM.dd HH:mm" /></span>
                </c:if>
                <span class="sep">·</span>
                <span>조회 <strong><fmt:formatNumber value="${article.viewCount}" /></strong></span>
                <span class="sep">·</span>
                <span>댓글 <strong><fmt:formatNumber value="${article.commentCount}" /></strong></span>
              </div>

              <figure class="hero">
                <img src="Stardew_Valley.jpg" alt="메인 이미지" loading="lazy"/>
                <c:if test="${not empty article.heroCaption}">
                  <figcaption><c:out value="${article.heroCaption}" /></figcaption>
                </c:if>
              </figure>

              <article class="content">
                <c:if test="${not empty article.bodyHtml}">
                  <c:out value="${article.bodyHtml}" escapeXml="false"/>
                </c:if>

                <div class="tags">
                  <c:forEach var="t" items="${tags}">
                    <a class="chip" href="/tag/${t}">#<c:out value="${t}" /> 농사</a>
                    <a class="chip" href="/tag/${t}">#<c:out value="${t}" /> 힐링</a>
                    <a class="chip" href="/tag/${t}">#<c:out value="${t}" /> 건축</a>
                    <a class="chip" href="/tag/${t}">#<c:out value="${t}" /> 인생 시뮬레이션</a>
                  </c:forEach>
                </div>

                <div class="prevnext">
                  <c:if test="${not empty prev}">
                    <a class="pn-card" href="/view?id=${prev.id}">← 이전 기사: <strong><c:out value="${prev.title}"/></strong></a>
                  </c:if>
                  <c:if test="${not empty next}">
                    <a class="pn-card" href="/view?id=${next.id}">다음 기사: <strong><c:out value="${next.title}"/></strong> →</a>
                  </c:if>
                </div>
              </article>

              <div id="comments" style="margin-top:18px">
                <div class="card">
                  <h3>댓글</h3>
                  <div class="body">
                    <p style="color:var(--muted)">댓글 시스템을 연동하세요 (예: 자체 구현, Disqus 등).</p>
                  </div>
                </div>
              </div>
            </section>
          </div>
        </main>

        <aside class="sidebar">
          <div class="ad">
            <img src="광고배너_2.jpg" alt="광고 배너" width="300" height="250" />
          </div>

          <div class="card">
            <h3>연관 기사</h3>
            <div class="body list">
              <c:forEach var="r" items="${related}">
                <a href="/view?id=${r.id}">
                  <img class="thumb" src="Hollow_Knight.jpg" alt="썸네일" loading="lazy"/>
                  <span><c:out value="${r.title}" /></span>
                </a>
              </c:forEach>
            </div>
          </div>

          <div class="card">
            <h3>인기</h3>
            <div class="body list">
              <c:forEach var="t" items="${trending}">
                <a href="/view?id=${t.id}">
                  <span style="grid-column: span 2"><c:out value="${t.title}" /></span>
                </a>
              </c:forEach>
            </div>
          </div>

          <div class="ad">
            <img src="광고배너.jpg" alt="광고 배너" width="300" height="600" />
          </div>
        </aside>
      </div>
    </c:if>
  </div>

  <footer>
    <div class="container foot">
      <div>© <fmt:formatDate value="${now}" pattern="yyyy" /> YuhanGames</div>
      <div style="display:flex;gap:12px">
        <a href="#">회사소개</a>
        <a href="#">문의</a>
        <a href="#">개인정보처리방침</a>
        <a href="#">이용약관</a>
      </div>
    </div>
  </footer>
</body>
</html>

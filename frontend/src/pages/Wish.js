import React, { useState, useEffect } from 'react';
import {
  CardWrapper,
  CardHeader,
  CardHeading,
  CardBody,
  CardFieldset,
  CardInput,
  CardTitle,
  CardSelect,
  CardSelectOption,
  CardLink,
} from '../components/Card';
import styled from 'styled-components';
import logo from '../imgs/logo192.png'; // 예시 사진
import {ProductWrapper, Product} from '../components/Product'

const Body = styled.div`
  display: flex;
  align-items: 'center';
  justify-content: 'center';
  width: 100%;
`;

const Title = styled.div`
  padding-top: 48px;
  padding-bottom : 64px;
  padding-left: 64px;
  font-size: 40px;
  font-weight: bold;
`
const Wish = ({ history }) => {
  return (
    <Body style={{}}>
      <CardWrapper>
        <Title>
          찜목록
        </Title>
        <ProductWrapper>
          {Product(logo, '컨테이너', '1,000,000원')}
          {Product(logo, '컨테이너', '1,000,000원')}
          {Product(logo, '컨테이너', '1,000,000원')}
          {Product(logo, '컨테이너', '1,000,000원')}
          {Product(logo, '컨테이너', '1,000,000원')}
        </ProductWrapper>
        <ProductWrapper>
          {Product(logo, '컨테이너', '1,000,000원')}
          {Product(logo, '없음', '1,000,000원')}
          {Product(logo, '없음', '1,000,000원')}
          {Product(logo, '없음', '1,000,000원')}
          {Product(logo, '없음', '1,000,000원')}
        </ProductWrapper>
      </CardWrapper>

    </Body >
  )
}

export default Wish;
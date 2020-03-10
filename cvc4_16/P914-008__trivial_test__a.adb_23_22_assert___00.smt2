(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort element_float 0)

(define-fun in_range1 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp #b0 #b10000010 #b11100000000000000000000) x)
                                         (fp.leq x (fp #b0 #b11110011 #b00110100001001100001100)))))

(declare-fun user_eq (element_float element_float) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy element_float)

(declare-datatypes ((element_float__ref 0))
(((element_float__refqtmk (element_float__content element_float)))))
(define-fun element_float__ref_element_float__content__projection ((a element_float__ref)) element_float 
  (element_float__content a))

(declare-fun to_rep (element_float) Float32)

(declare-fun of_rep (Float32) element_float)

;; inversion_axiom
  (assert
  (forall ((x element_float))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x element_float)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element_float))))))
(declare-fun slide ((Array Int element_float) Int
  Int) (Array Int element_float))

;; slide_eq
  (assert
  (forall ((a (Array Int element_float)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_float)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element_float)) (a__first Int)
  (a__last Int) (b (Array Int element_float)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (fp.eq (to_rep (select a temp___idx_155)) 
                           (to_rep
                           (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int element_float)) (b (Array Int element_float)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (fp.eq (to_rep (select a temp___idx_155)) (to_rep
                                            (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const a (Array Int element_float))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tindex_typeB 0)

(declare-fun tindex_typeBqtint (tindex_typeB) Int)

;; tindex_typeB'axiom
  (assert
  (forall ((i tindex_typeB))
  (and (<= (- 128) (tindex_typeBqtint i)) (<= (tindex_typeBqtint i) 127))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tindex_typeB tindex_typeB) Bool)

(declare-const dummy1 tindex_typeB)

(declare-datatypes ((tindex_typeB__ref 0))
(((tindex_typeB__refqtmk (tindex_typeB__content tindex_typeB)))))
(define-fun tindex_typeB__ref_tindex_typeB__content__projection ((a1 tindex_typeB__ref)) tindex_typeB 
  (tindex_typeB__content a1))

(define-fun to_rep1 ((x tindex_typeB)) Int (tindex_typeBqtint x))

(declare-fun of_rep1 (Int) tindex_typeB)

;; inversion_axiom
  (assert
  (forall ((x tindex_typeB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tindex_typeB)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index_type index_type) Bool)

(declare-const dummy2 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a1 index_type__ref)) index_type 
  (index_type__content a1))

(declare-sort t 0)

(declare-fun first (t) tindex_typeB)

(declare-fun last (t) tindex_typeB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int element_float))(rt t)))))
(define-fun to_array ((a1 us_t)) (Array Int element_float) (elts a1))

(define-fun of_array ((a1 (Array Int element_float)) (f Int)
  (l Int)) us_t (us_tqtmk a1 (mk f l)))

(define-fun first1 ((a1 us_t)) Int (to_rep1 (first (rt a1))))

(define-fun last1 ((a1 us_t)) Int (to_rep1 (last (rt a1))))

(define-fun length ((a1 us_t)) Int (ite (<= (first1 a1) (last1 a1))
                                   (+ (- (last1 a1) (first1 a1)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((array_float_u__ref 0))
(((array_float_u__refqtmk (array_float_u__content us_t)))))
(define-fun array_float_u__ref_array_float_u__content__projection ((a1 array_float_u__ref)) us_t 
  (array_float_u__content a1))

(declare-datatypes ((a__ref 0))
(((a__refqtmk (a__content us_t)))))
(define-fun a__ref_a__content__projection ((a1 a__ref)) us_t (a__content a1))

(define-fun dynamic_invariant ((temp___expr_203 us_t)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (not (= temp___skip_constant_200 true))
                                     (dynamic_property 1 10
                                     (first1 temp___expr_203)
                                     (last1 temp___expr_203))))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 10)) (in_range3 temp___expr_160)))

(define-fun dynamic_invariant2 ((temp___expr_174 Float32)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (fp.leq (fp #b0 #b10000010 #b11100000000000000000000) (fp #b0 #b11110011 #b00110100001001100001100)))
                                     (in_range1 temp___expr_174)))

(define-fun dynamic_invariant3 ((temp___expr_223 us_t)
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (=>
                                     (not (= temp___skip_constant_220 true))
                                     (dynamic_property 1 10
                                     (first1 temp___expr_223)
                                     (last1 temp___expr_223))))

(assert
;; defqtvc
 ;; File "a.ads", line 13, characters 0-0
  (not
  (=>
  (forall ((i Int))
  (=> (and (<= 2 i) (<= i 10))
  (fp.lt (to_rep (select a (- i 1))) (to_rep (select a i)))))
  (=> (dynamic_property 1 10 1 10)
  (let ((temp___226 (of_array a 1 10)))
  (=> (dynamic_property 1 10 (first1 temp___226) (last1 temp___226))
  (let ((o (of_array (to_array temp___226) (first1 temp___226)
           (last1 temp___226))))
  (=>
  (forall ((i Int))
  (=> (and (<= (first1 o) i) (<= i (last1 o)))
  (forall ((j Int))
  (=> (and (<= (first1 o) j) (<= j (last1 o)))
  (=> (< i j)
  (fp.lt (to_rep (select (to_array o) i)) (to_rep (select (to_array o) j))))))))
  (forall ((i Int))
  (=> (and (<= 1 i) (<= i 10))
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j 10))
  (=> (< i j) (fp.lt (to_rep (select a i)) (to_rep (select a j))))))))))))))))
(check-sat)
(exit)

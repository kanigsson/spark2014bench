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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((integer_array__ref 0))
(((integer_array__refqtmk (integer_array__content us_t)))))
(define-fun integer_array__ref_integer_array__content__projection ((a integer_array__ref)) us_t 
  (integer_array__content a))

(declare-const dummy3 (Array Int integer))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq3 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int (Array Int integer)))))))
(declare-fun slide1 ((Array Int (Array Int integer)) Int
  Int) (Array Int (Array Int integer)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int integer))))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int integer))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int (Array Int integer))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int integer))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155) 1 2
                              (select b (+ (- b__first a__first) temp___idx_155))
                              1 2) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int integer)))
  (b (Array Int (Array Int integer))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155) 1 2
     (select b (+ (- b__first a__first) temp___idx_155)) 1 2) true))))))))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last2 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first2 (mk1 f l))) f) (= (to_rep (last2 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int (Array Int integer)))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int (Array Int integer)) (elts1 a))

(define-fun of_array1 ((a (Array Int (Array Int integer))) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep (first2 (rt1 x)))
                  (to_rep (last2 (rt1 x))) (elts1 y)
                  (to_rep (first2 (rt1 y))) (to_rep (last2 (rt1 y)))))

(declare-fun user_eq4 (us_t1 us_t1) Bool)

(declare-const dummy4 us_t1)

(declare-datatypes ((integer_product_type__ref 0))
(((integer_product_type__refqtmk (integer_product_type__content us_t1)))))
(define-fun integer_product_type__ref_integer_product_type__content__projection ((a integer_product_type__ref)) us_t1 
  (integer_product_type__content a))

(declare-fun in_array ((Array Int integer) us_t1) Bool)

(declare-fun in_array__function_guard (Bool (Array Int integer) us_t1) Bool)

(declare-sort tpair_typeD1 0)

(declare-fun tpair_typeD1qtint (tpair_typeD1) Int)

;; tpair_typeD1'axiom
  (assert
  (forall ((i tpair_typeD1))
  (and (<= 1 (tpair_typeD1qtint i)) (<= (tpair_typeD1qtint i) 2))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (tpair_typeD1 tpair_typeD1) Bool)

(declare-const dummy5 tpair_typeD1)

(declare-datatypes ((tpair_typeD1__ref 0))
(((tpair_typeD1__refqtmk (tpair_typeD1__content tpair_typeD1)))))
(define-fun tpair_typeD1__ref_tpair_typeD1__content__projection ((a tpair_typeD1__ref)) tpair_typeD1 
  (tpair_typeD1__content a))

(define-fun dynamic_invariant1 ((temp___expr_180 us_t1)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (not (= temp___skip_constant_177 true))
                                     (dynamic_property1 0 2147483647
                                     (first3 temp___expr_180)
                                     (last3 temp___expr_180))))

;; in_array__post_axiom
  (assert true)

;; in_array__def_axiom
  (assert
  (forall ((element (Array Int integer)))
  (forall ((arr us_t1))
  (! (= (= (in_array element arr) true)
     (exists ((i Int))
     (and (and (<= (first3 arr) i) (<= i (last3 arr)))
     (= (let ((temp___196 (select (to_array1 arr) i)))
        (bool_eq temp___196 1 2 element 1 2)) true)))) :pattern ((in_array
                                                                 element arr)) ))))

(declare-const array1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const array2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const result_length Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const result____first integer)

(declare-const result____last integer)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant2 ((temp___expr_164 us_t)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (not (= temp___skip_constant_161 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_164)
                                     (last1 temp___expr_164))))

(declare-datatypes ((tresultS__ref 0))
(((tresultS__refqtmk (tresultS__content us_t1)))))
(define-fun tresultS__ref_tresultS__content__projection ((a tresultS__ref)) us_t1 
  (tresultS__content a))

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_t1)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_t1 (t6b__content
                                                                   a))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content integer)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) integer 
  (t7b__content a))

(define-fun dynamic_property3 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (integer integer) Bool)

(declare-const dummy7 integer)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content integer)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) integer 
  (t8b__content a))

(declare-fun temp_____aggregate_def_208 (Int Int) (Array Int integer))

(declare-fun cartesian__cartesian_product__result__aggregate_def ((Array Int integer)
  Int Int) us_t1)

(declare-fun temp_____aggregate_def_273 (Int Int) (Array Int integer))

(declare-fun temp_____aggregate_def_285 (Int Int) (Array Int integer))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; result_length__def_axiom
  (assert (= result_length (* (length array1) (length array2))))

;; def_axiom
  (assert
  (forall ((temp___269 (Array Int integer)))
  (forall ((temp___270 Int) (temp___271 Int))
  (let ((temp___268 (cartesian__cartesian_product__result__aggregate_def
                    temp___269 temp___270 temp___271)))
  (and
  (=> (dynamic_property1 0 2147483647 temp___270 temp___271)
  (and (= (first3 temp___268) temp___270) (= (last3 temp___268) temp___271)))
  (forall ((temp___272 Int))
  (= (select (to_array1 temp___268) temp___272) temp___269)))))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___275 Int) (temp___276 Int))
  (let ((temp___274 (temp_____aggregate_def_273 temp___275 temp___276)))
  (=>
  (and (dynamic_invariant3 temp___275 true true true true)
  (dynamic_invariant3 temp___276 true true true true))
  (and (= (select temp___274 1) rliteral) (= (select temp___274 2) rliteral))))))

;; def_axiom
  (assert
  (forall ((temp___287 Int) (temp___288 Int))
  (let ((temp___286 (temp_____aggregate_def_285 temp___287 temp___288)))
  (=>
  (and (dynamic_invariant3 temp___287 true true true true)
  (dynamic_invariant3 temp___288 true true true true))
  (and (= (to_rep (select temp___286 1)) temp___287)
  (= (to_rep (select temp___286 2)) temp___288))))))

;; def_axiom
  (assert
  (forall ((temp___210 Int) (temp___211 Int))
  (let ((temp___209 (temp_____aggregate_def_208 temp___210 temp___211)))
  (=>
  (and (dynamic_invariant3 temp___210 true true true true)
  (dynamic_invariant3 temp___211 true true true true))
  (and (= (to_rep (select temp___209 1)) temp___210)
  (= (to_rep (select temp___209 2)) temp___211))))))

(define-fun dynamic_invariant4 ((temp___expr_247 us_t1)
  (temp___is_init_243 Bool) (temp___skip_constant_244 Bool)
  (temp___do_toplevel_245 Bool)
  (temp___do_typ_inv_246 Bool)) Bool (=>
                                     (not (= temp___skip_constant_244 true))
                                     (and (dynamic_property1 1 result_length
                                     (first3 temp___expr_247)
                                     (last3 temp___expr_247))
                                     (and (= (first3 temp___expr_247) 1)
                                     (= (last3 temp___expr_247) result_length)))))

(define-fun default_initial_assumption ((temp___expr_250 us_t1)
  (temp___skip_top_level_251 Bool)) Bool (and (= (first3 temp___expr_250) 1)
                                         (= (last3 temp___expr_250) result_length)))

(assert
;; defqtvc
 ;; File "cartesian.ads", line 43, characters 0-0
  (not
  (=> (dynamic_invariant2 array1 true false true true)
  (=> (dynamic_invariant2 array2 true false true true)
  (=> (< (length array1) 255)
  (=> (< (length array2) 255)
  (let ((o (length array2)))
  (=> (in_range1 o)
  (let ((o1 (length array1)))
  (=> (in_range1 o1)
  (let ((o2 (* o1 o)))
  (=> (in_range1 o2)
  (=> (in_range2 o2)
  (=> (= o2 result_length)
  (=> (dynamic_invariant result_length true false true true)
  (let ((temp___278 (cartesian__cartesian_product__result__aggregate_def
                    (temp_____aggregate_def_273 0 0) 1 result_length)))
  (=> (= (first3 temp___278) 1)
  (=> (= (last3 temp___278) result_length)
  (=>
  (ite (<= (first3 temp___278) (last3 temp___278))
  (and (<= 1 result_length)
  (= (- (last3 temp___278) (first3 temp___278)) (- result_length 1)))
  (< result_length 1))
  (let ((cartesian__cartesian_product__result__assume (of_array1
                                                      (to_array1 temp___278)
                                                      (first3 temp___278)
                                                      (last3 temp___278))))
  (forall ((result__ (Array Int (Array Int integer))))
  (=> (= result__ (to_array1 cartesian__cartesian_product__result__assume))
  (=>
  (= (to_rep result____first) (first3
                              cartesian__cartesian_product__result__assume))
  (=>
  (= (to_rep result____last) (last3
                             cartesian__cartesian_product__result__assume))
  (=>
  (and (dynamic_property1 1 result_length (to_rep result____first)
  (to_rep result____last))
  (and (= (to_rep result____first) 1)
  (= (to_rep result____last) result_length)))
  (forall ((result_index Int))
  (=> (= result_index 0)
  (=> (dynamic_invariant result_index true false true true)
  (let ((temp___281 (first1 array1)))
  (forall ((index1 Int))
  (=> (= index1 temp___281)
  (=>
  (= (and (ite (<= temp___281 index1) true false) (ite (<= index1 (last1
                                                                  array1))
                                                  true false)) true)
  (forall ((result__1 (Array Int (Array Int integer))) (result_index1 Int)
  (index2 Int))
  (=>
  (let ((temp___283 (first1 array2)))
  (let ((temp___284 (last1 array2)))
  (exists ((index21 Int))
  (and (= index21 temp___283)
  (ite (= (and (ite (<= temp___283 index21) true false) (ite (<= index21 temp___284)
                                                        true false)) true)
  (let ((o3 (+ result_index 1)))
  (and (in_range1 o3)
  (exists ((result_index2 Int))
  (and (= result_index2 o3)
  (exists ((o4 Int))
  (and (= (to_rep (select (to_array array2) index21)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array array1) index1)) o5)
  (and
  (and (<= (to_rep result____first) result_index2)
  (<= result_index2 (to_rep result____last)))
  (exists ((result__2 (Array Int (Array Int integer))))
  (and
  (= result__2 (store result__ result_index2 (temp_____aggregate_def_285 o5
                                             o4)))
  (let ((o6 (- index21 (first1 array2))))
  (and (in_range1 o6)
  (let ((o7 (length array2)))
  (and (in_range1 o7)
  (let ((o8 (- index1 (first1 array1))))
  (and (in_range1 o8)
  (let ((o9 (* o8 o7)))
  (and (in_range1 o9)
  (let ((o10 (+ o9 o6)))
  (and (in_range1 o10)
  (and (in_range1 (+ o10 1))
  (and
  (and
  (= result_index1 (+ (+ (* (- index1 (first1 array1)) (length array2)) (- index2 
  (first1 array2))) 1))
  (and
  (forall ((j Int))
  (=> (and (<= (first1 array2) j) (<= j index2))
  (= (to_rep
     (select (select result__1 (+ (+ (* (- index1 (first1 array1)) (length
                                                                   array2)) (- j 
     (first1 array2))) 1)) 1)) (to_rep (select (to_array array1) index1)))))
  (forall ((j Int))
  (=> (and (<= (first1 array2) j) (<= j index2))
  (= (to_rep
     (select (select result__1 (+ (+ (* (- index1 (first1 array1)) (length
                                                                   array2)) (- j 
     (first1 array2))) 1)) 2)) (to_rep (select (to_array array2) j)))))))
  (and
  (= (and (ite (and (dynamic_property3 (first1 array2) (last1 array2) index2)
               (dynamic_invariant result_index1 true true true true))
          true false) (ite (and (<= (first1 array2) index2)
                           (<= index2 (last1 array2)))
                      true false)) true)
  (= index2 temp___284)))))))))))))))))))))))))
  (and (and (= result__1 result__) (= result_index1 result_index))
  (= index2 index21)))))))
  (let ((o3 (length array2)))
  (=> (in_range1 o3)
  (let ((o4 (- index1 (first1 array1))))
  (=> (in_range1 o4)
  (let ((o5 (+ o4 1)))
  (=> (in_range1 o5)
  (=> (in_range1 (* o5 o3))
  (forall ((usf Int))
  (=>
  (= (and (ite (<= (first1 array1) usf) true false) (ite (<= usf index1) true
                                                    false)) true)
  (forall ((usf1 Int))
  (=>
  (= (and (ite (<= (first1 array2) usf1) true false) (ite (<= usf1 (last1
                                                                   array2))
                                                     true false)) true)
  (=> (and (<= (first1 array1) usf) (<= usf (last1 array1)))
  (forall ((o6 Int))
  (=> (= (to_rep (select (to_array array1) usf)) o6)
  (=> (in_range1 (- usf1 (first1 array2)))
  (=> (in_range1 (length array2)) (in_range1 (- usf (first1 array1)))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)

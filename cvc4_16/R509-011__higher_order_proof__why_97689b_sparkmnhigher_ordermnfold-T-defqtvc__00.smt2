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
                           (forall ((temp___idx_157 Int))
                           (=>
                           (and (<= a__first temp___idx_157)
                           (<= temp___idx_157 a__last))
                           (= (to_rep (select a temp___idx_157)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_157)))))))
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
  (forall ((temp___idx_157 Int))
  (=> (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (= (to_rep (select a temp___idx_157)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_157)))))))))))

(declare-sort small_index 0)

(declare-fun small_indexqtint (small_index) Int)

;; small_index'axiom
  (assert
  (forall ((i small_index))
  (and (<= 1 (small_indexqtint i)) (<= (small_indexqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (small_index small_index) Bool)

(declare-const dummy1 small_index)

(declare-datatypes ((small_index__ref 0))
(((small_index__refqtmk (small_index__content small_index)))))
(define-fun small_index__ref_small_index__content__projection ((a small_index__ref)) small_index 
  (small_index__content a))

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

(declare-datatypes ((small_array__ref 0))
(((small_array__refqtmk (small_array__content us_t)))))
(define-fun small_array__ref_small_array__content__projection ((a small_array__ref)) us_t 
  (small_array__content a))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-fun in_range3 (us_t Int Int) Bool)

(declare-fun in_range__function_guard (Bool us_t Int Int) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (index_type index_type) Bool)

(declare-const dummy3 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_210 Int)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (<= 1 100)) (in_range4 temp___expr_210)))

(define-fun dynamic_invariant2 ((temp___expr_230 us_t)
  (temp___is_init_226 Bool) (temp___skip_constant_227 Bool)
  (temp___do_toplevel_228 Bool)
  (temp___do_typ_inv_229 Bool)) Bool (=>
                                     (not (= temp___skip_constant_227 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_230)
                                     (last1 temp___expr_230))))

;; in_range__post_axiom
  (assert true)

;; in_range__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int) (i Int))
  (! (= (= (in_range3 a x i) true)
     (and (<= (* (- 100) (- i (first1 a))) x)
     (<= x (* 100 (- i (first1 a)))))) :pattern ((in_range3 a x i)) ))))

(declare-fun value (Int) Int)

(declare-fun value__function_guard (Int Int) Bool)

;; temp___result_165'def
  (assert (forall ((x Int)) (value__function_guard (value x) x)))

(define-fun add_value ((x Int) (y Int)) Int (+ (value x) y))

(declare-fun add_value__function_guard (Int Int Int) Bool)

(declare-datatypes ((array_type__ref1 0))
(((array_type__refqtmk1 (array_type__content1 us_t)))))
(define-fun array_type__ref_array_type__content__3__projection ((a array_type__ref1)) us_t 
  (array_type__content1 a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort index_type1 0)

(declare-fun index_typeqtint1 (index_type1) Int)

;; index_type'axiom
  (assert
  (forall ((i1 index_type1))
  (and (<= 1 (index_typeqtint1 i1)) (<= (index_typeqtint1 i1) 100))))

(define-fun in_range5 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_type1 index_type1) Bool)

(declare-const dummy4 index_type1)

(declare-datatypes ((index_type__ref1 0))
(((index_type__refqtmk1 (index_type__content1 index_type1)))))
(define-fun index_type__ref_index_type__content__3__projection ((a1 index_type__ref1)) index_type1 
  (index_type__content1 a1))

(define-fun dynamic_invariant3 ((temp___expr_275 Int)
  (temp___is_init_271 Bool) (temp___skip_constant_272 Bool)
  (temp___do_toplevel_273 Bool)
  (temp___do_typ_inv_274 Bool)) Bool (=>
                                     (or (= temp___is_init_271 true)
                                     (<= 1 100)) (in_range5 temp___expr_275)))

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i1 element_out))
  (and (<= (- 2147483648) (element_outqtint i1))
  (<= (element_outqtint i1) 2147483647))))

(define-fun in_range6 ((x1 Int)) Bool (and (<= (- 2147483648) x1)
                                      (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (element_out element_out) Bool)

(declare-const dummy5 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__3__projection ((a1 element_out__ref)) element_out 
  (element_out__content a1))

(define-fun dynamic_invariant4 ((temp___expr_295 Int)
  (temp___is_init_291 Bool) (temp___skip_constant_292 Bool)
  (temp___do_toplevel_293 Bool)
  (temp___do_typ_inv_294 Bool)) Bool (=>
                                     (or (= temp___is_init_291 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range6 temp___expr_295)))

(define-fun dynamic_invariant5 ((temp___expr_289 us_t)
  (temp___is_init_285 Bool) (temp___skip_constant_286 Bool)
  (temp___do_toplevel_287 Bool)
  (temp___do_typ_inv_288 Bool)) Bool (=>
                                     (not (= temp___skip_constant_286 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_289)
                                     (last1 temp___expr_289))))

(declare-sort my_small 0)

(declare-fun my_smallqtint (my_small) Int)

;; my_small'axiom
  (assert
  (forall ((i1 my_small))
  (and (<= (- 100) (my_smallqtint i1)) (<= (my_smallqtint i1) 100))))

(define-fun in_range7 ((x1 Int)) Bool (and (<= (- 100) x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (my_small my_small) Bool)

(declare-const dummy6 my_small)

(declare-datatypes ((my_small__ref 0))
(((my_small__refqtmk (my_small__content my_small)))))
(define-fun my_small__ref_my_small__content__projection ((a1 my_small__ref)) my_small 
  (my_small__content a1))

(define-fun dynamic_invariant6 ((temp___expr_196 Int)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (or (= temp___is_init_192 true)
                                     (<= (- 100) 100)) (in_range7
                                     temp___expr_196)))

;; value__post_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (dynamic_invariant x1 true true true true)
     (let ((result (value x1)))
     (=> (value__function_guard result x1) (dynamic_invariant6 result true
     false true true)))) :pattern ((value x1)) )))

(define-fun dynamic_invariant7 ((temp___expr_203 Int)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (or (= temp___is_init_199 true)
                                     (<= 1 100)) (in_range2 temp___expr_203)))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 53, characters 0-0
  (not
  (=> (dynamic_invariant5 a true false true true)
  (=> (dynamic_invariant4 x true false true true)
  (=> (dynamic_invariant3 i true false true true)
  (=>
  (= (and (ite (<= (first1 a) i) true false) (ite (<= i (last1 a)) true
                                             false)) true)
  (dynamic_property 1 100 (first1 a) (last1 a))))))))
(check-sat)
(exit)

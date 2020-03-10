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
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep (select a temp___idx_156)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_156)))))))
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
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep (select a temp___idx_156)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_156)))))))))))

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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (natural natural) Bool)

(declare-const dummy3 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range4
                                    temp___expr_39)))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_type index_type) Bool)

(declare-const dummy4 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_217 Int)
  (temp___is_init_213 Bool) (temp___skip_constant_214 Bool)
  (temp___do_toplevel_215 Bool)
  (temp___do_typ_inv_216 Bool)) Bool (=>
                                     (or (= temp___is_init_213 true)
                                     (<= 1 100)) (in_range5 temp___expr_217)))

(define-fun dynamic_invariant2 ((temp___expr_237 us_t)
  (temp___is_init_233 Bool) (temp___skip_constant_234 Bool)
  (temp___do_toplevel_235 Bool)
  (temp___do_typ_inv_236 Bool)) Bool (=>
                                     (not (= temp___skip_constant_234 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_237)
                                     (last1 temp___expr_237))))

;; in_range__post_axiom
  (assert true)

;; in_range__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int) (i Int))
  (! (= (= (in_range3 a x i) true) (<= x (- i (first1 a)))) :pattern (
  (in_range3 a x i)) ))))

(declare-fun in_range_last (us_t Int) Bool)

(declare-fun in_range_last__function_guard (Bool us_t Int) Bool)

;; in_range_last__post_axiom
  (assert true)

;; in_range_last__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int))
  (! (= (= (in_range_last a x) true) (<= x (length a))) :pattern ((in_range_last
                                                                  a x)) ))))

(declare-fun choose (Int) Bool)

(declare-fun choose__function_guard (Bool Int) Bool)

;; temp___result_160'def
  (assert (forall ((e Int)) (choose__function_guard (choose e) e)))

(define-fun add_one ((e Int)
  (x Int)) Int (ite (= (choose e) true) (+ x 1) x))

(declare-fun add_one__function_guard (Int Int Int) Bool)

(declare-datatypes ((array_type__ref1 0))
(((array_type__refqtmk1 (array_type__content1 us_t)))))
(define-fun array_type__ref_array_type__content__3__projection ((a array_type__ref1)) us_t 
  (array_type__content1 a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const init Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort index_type1 0)

(declare-fun index_typeqtint1 (index_type1) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type1))
  (and (<= 1 (index_typeqtint1 i)) (<= (index_typeqtint1 i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (index_type1 index_type1) Bool)

(declare-const dummy5 index_type1)

(declare-datatypes ((index_type__ref1 0))
(((index_type__refqtmk1 (index_type__content1 index_type1)))))
(define-fun index_type__ref_index_type__content__3__projection ((a1 index_type__ref1)) index_type1 
  (index_type__content1 a1))

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out))
  (and (<= 0 (element_outqtint i)) (<= (element_outqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (element_out element_out) Bool)

(declare-const dummy6 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__2__projection ((a1 element_out__ref)) element_out 
  (element_out__content a1))

(define-fun to_rep1 ((x element_out)) Int (element_outqtint x))

(declare-fun of_rep1 (Int) element_out)

;; inversion_axiom
  (assert
  (forall ((x element_out))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element_out)) (! (in_range7
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range7 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int element_out))))))
(declare-fun slide1 ((Array Int element_out) Int
  Int) (Array Int element_out))

;; slide_eq
  (assert
  (forall ((a1 (Array Int element_out)))
  (forall ((first2 Int))
  (! (= (slide1 a1 first2 first2) a1) :pattern ((slide1 a1 first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a1 (Array Int element_out)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a1 old_first new_first) i) (select a1 (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a1 old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a1 (Array Int element_out)) (a__first Int)
  (a__last Int) (b (Array Int element_out)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_161 Int))
                           (=>
                           (and (<= a__first temp___idx_161)
                           (<= temp___idx_161 a__last))
                           (= (to_rep1 (select a1 temp___idx_161)) (to_rep1
                                                                   (select b (+ (- b__first a__first) temp___idx_161)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a1 (Array Int element_out)) (b (Array Int element_out)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a1 a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_161 Int))
  (=> (and (<= a__first temp___idx_161) (<= temp___idx_161 a__last))
  (= (to_rep1 (select a1 temp___idx_161)) (to_rep1
                                          (select b (+ (- b__first a__first) temp___idx_161)))))))))))

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
                   (=> (<= low high) (and (in_range6 low) (in_range6 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int element_out))(rt1 t1)))))
(define-fun to_array1 ((a1 us_t1)) (Array Int element_out) (elts1 a1))

(define-fun of_array1 ((a1 (Array Int element_out)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a1 (mk1 f l)))

(define-fun first3 ((a1 us_t1)) Int (to_rep (first2 (rt1 a1))))

(define-fun last3 ((a1 us_t1)) Int (to_rep (last2 (rt1 a1))))

(define-fun length1 ((a1 us_t1)) Int (ite (<= (first3 a1) (last3 a1))
                                     (+ (- (last3 a1) (first3 a1)) 1) 0))

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

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep (first2 (rt1 x)))
                  (to_rep (last2 (rt1 x))) (elts1 y)
                  (to_rep (first2 (rt1 y))) (to_rep (last2 (rt1 y)))))

(declare-fun user_eq7 (us_t1 us_t1) Bool)

(declare-const dummy7 us_t1)

(declare-datatypes ((acc_array__ref 0))
(((acc_array__refqtmk (acc_array__content us_t1)))))
(define-fun acc_array__ref_acc_array__content__projection ((a1 acc_array__ref)) us_t1 
  (acc_array__content a1))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r__first integer)

(declare-const r__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant3 ((temp___expr_295 Int)
  (temp___is_init_291 Bool) (temp___skip_constant_292 Bool)
  (temp___do_toplevel_293 Bool)
  (temp___do_typ_inv_294 Bool)) Bool (=>
                                     (or (= temp___is_init_291 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_295)))

(declare-datatypes ((trS__ref 0))
(((trS__refqtmk (trS__content us_t1)))))
(define-fun trS__ref_trS__content__projection ((a1 trS__ref)) us_t1 (trS__content
                                                                    a1))

(declare-datatypes ((t123s__ref 0))
(((t123s__refqtmk (t123s__content us_t1)))))
(define-fun t123s__ref_t123s__content__projection ((a1 t123s__ref)) us_t1 
  (t123s__content a1))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ((t124s__ref 0))
(((t124s__refqtmk (t124s__content integer)))))
(define-fun t124s__ref_t124s__content__projection ((a1 t124s__ref)) integer 
  (t124s__content a1))

(define-fun dynamic_invariant4 ((temp___expr_289 us_t)
  (temp___is_init_285 Bool) (temp___skip_constant_286 Bool)
  (temp___do_toplevel_287 Bool)
  (temp___do_typ_inv_288 Bool)) Bool (=>
                                     (not (= temp___skip_constant_286 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_289)
                                     (last1 temp___expr_289))))

(declare-fun test_higher_order3__my_count__count_left__acc__fold__R121s__r__aggregate_def (Int
  Int Int) us_t1)

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; choose__post_axiom
  (assert true)

(define-fun dynamic_invariant6 ((temp___expr_210 Int)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (<= 1 100)) (in_range2 temp___expr_210)))

(define-fun dynamic_invariant7 ((temp___expr_308 us_t1)
  (temp___is_init_304 Bool) (temp___skip_constant_305 Bool)
  (temp___do_toplevel_306 Bool)
  (temp___do_typ_inv_307 Bool)) Bool (=>
                                     (not (= temp___skip_constant_305 true))
                                     (dynamic_property1 1 100
                                     (first3 temp___expr_308)
                                     (last3 temp___expr_308))))

(define-fun dynamic_invariant8 ((temp___expr_275 Int)
  (temp___is_init_271 Bool) (temp___skip_constant_272 Bool)
  (temp___do_toplevel_273 Bool)
  (temp___do_typ_inv_274 Bool)) Bool (=>
                                     (or (= temp___is_init_271 true)
                                     (<= 1 100)) (in_range6 temp___expr_275)))

;; def_axiom
  (assert
  (forall ((temp___1191 Int) (temp___1192 Int) (temp___1193 Int))
  (let ((temp___1190 (test_higher_order3__my_count__count_left__acc__fold__R121s__r__aggregate_def
                     temp___1191 temp___1192 temp___1193)))
  (=> (dynamic_invariant3 temp___1191 true true true true)
  (and
  (=> (dynamic_property1 1 100 temp___1192 temp___1193)
  (and (= (first3 temp___1190) temp___1192)
  (= (last3 temp___1190) temp___1193)))
  (forall ((temp___1194 Int))
  (= (to_rep1 (select (to_array1 temp___1190) temp___1194)) temp___1191)))))))

(define-fun dynamic_invariant9 ((temp___expr_336 us_t1)
  (temp___is_init_332 Bool) (temp___skip_constant_333 Bool)
  (temp___do_toplevel_334 Bool)
  (temp___do_typ_inv_335 Bool)) Bool (=>
                                     (not (= temp___skip_constant_333 true))
                                     (and (dynamic_property1 (first1 a)
                                     (last1 a) (first3 temp___expr_336)
                                     (last3 temp___expr_336))
                                     (and
                                     (= (first3 temp___expr_336) (first1 a))
                                     (= (last3 temp___expr_336) (last1 a))))))

(define-fun default_initial_assumption ((temp___expr_338 us_t1)
  (temp___skip_top_level_339 Bool)) Bool (and
                                         (= (first3 temp___expr_338) 
                                         (first1 a))
                                         (= (last3 temp___expr_338) (last1 a))))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 69, characters 0-0
  (not
  (forall ((acc Int))
  (=> (dynamic_invariant4 a true false true true)
  (=> (dynamic_invariant3 init true false true true)
  (=> (< 0 (length a))
  (=> (in_range__function_guard
  (in_range3 (of_array (to_array a) (first1 a) (last1 a)) init (first1 a))
  (of_array (to_array a) (first1 a) (last1 a)) init (first1 a))
  (=>
  (= (in_range3 (of_array (to_array a) (first1 a) (last1 a)) init (first1 a)) true)
  (=> (= acc init)
  (=> (dynamic_invariant3 acc true false true true)
  (let ((temp___1195 (test_higher_order3__my_count__count_left__acc__fold__R121s__r__aggregate_def
                     init (first1 a) (last1 a))))
  (=> (= (first3 temp___1195) (first1 a))
  (=> (= (last3 temp___1195) (last1 a))
  (=>
  (ite (<= (first3 temp___1195) (last3 temp___1195))
  (and (<= (first1 a) (last1 a))
  (= (- (last3 temp___1195) (first3 temp___1195)) (- (last1 a) (first1 a))))
  (< (last1 a) (first1 a)))
  (let ((test_higher_order3__my_count__count_left__acc__fold__R121s__r__assume 
  (of_array1 (slide1 (to_array1 temp___1195) (first3 temp___1195) (first1 a))
  (first1 a) (last1 a))))
  (forall ((r (Array Int element_out)))
  (=>
  (= r (to_array1
       test_higher_order3__my_count__count_left__acc__fold__R121s__r__assume))
  (=>
  (= (to_rep r__first) (first3
                       test_higher_order3__my_count__count_left__acc__fold__R121s__r__assume))
  (=>
  (= (to_rep r__last) (last3
                      test_higher_order3__my_count__count_left__acc__fold__R121s__r__assume))
  (=>
  (and (dynamic_property1 (first1 a) (last1 a) (to_rep r__first)
  (to_rep r__last))
  (and (= (to_rep r__first) (first1 a)) (= (to_rep r__last) (last1 a))))
  (forall ((r1 (Array Int element_out)))
  (=>
  (forall ((acc1 Int) (i Int)) (in_range__function_guard
  (in_range3 (of_array (to_array a) (first1 a) (last1 a)) acc1 i)
  (of_array (to_array a) (first1 a) (last1 a)) acc1 i))
  (=> (forall ((o Int)) (choose__function_guard (choose o) o))
  (=> (forall ((o Int)) (choose__function_guard (choose o) o))
  (=> (in_range__function_guard
  (in_range3 (of_array (to_array a) (first1 a) (last1 a)) init (first1 a))
  (of_array (to_array a) (first1 a) (last1 a)) init (first1 a))
  (=>
  (forall ((r2 (Array Int element_out)) (k Int)) (in_range__function_guard
  (in_range3 (of_array (to_array a) (first1 a) (last1 a))
  (to_rep1 (select r2 (- k 1))) k)
  (of_array (to_array a) (first1 a) (last1 a)) (to_rep1 (select r2 (- k 1)))
  k))
  (=>
  (forall ((acc1 Int) (i Int)) (in_range__function_guard
  (in_range3 (of_array (to_array a) (first1 a) (last1 a)) acc1 i)
  (of_array (to_array a) (first1 a) (last1 a)) acc1 i))
  (=> (forall ((o Int)) (choose__function_guard (choose o) o))
  (=> (forall ((o Int)) (choose__function_guard (choose o) o))
  (=> (in_range__function_guard
  (in_range3 (of_array (to_array a) (first1 a) (last1 a)) init (first1 a))
  (of_array (to_array a) (first1 a) (last1 a)) init (first1 a))
  (=>
  (forall ((r2 (Array Int element_out)) (k Int)) (in_range__function_guard
  (in_range3 (of_array (to_array a) (first1 a) (last1 a))
  (to_rep1 (select r2 (- k 1))) k)
  (of_array (to_array a) (first1 a) (last1 a)) (to_rep1 (select r2 (- k 1)))
  k))
  (=>
  (forall ((acc1 Int) (i Int) (o us_t)) (in_range__function_guard
  (in_range3 (of_array (to_array o) (first1 o) (last1 o))
  (add_one (to_rep (select (to_array o) i)) acc1) (+ i 1))
  (of_array (to_array o) (first1 o) (last1 o))
  (add_one (to_rep (select (to_array o) i)) acc1) (+ i 1)))
  (=>
  (forall ((acc1 Int) (o us_t)) (in_range_last__function_guard
  (in_range_last (of_array (to_array o) (first1 o) (last1 o))
  (add_one (to_rep (select (to_array o) (last1 o))) acc1))
  (of_array (to_array o) (first1 o) (last1 o))
  (add_one (to_rep (select (to_array o) (last1 o))) acc1)))
  (=>
  (let ((temp___1198 (first1 a)))
  (let ((temp___1199 (last1 a)))
  (exists ((i Int))
  (and (= i temp___1198)
  (ite (= (and (ite (<= temp___1198 i) true false) (ite (<= i temp___1199)
                                                   true false)) true)
  (and
  (= (in_range3 (of_array (to_array a) (first1 a) (last1 a)) acc i) true)
  (exists ((o Int))
  (and (= (to_rep (select (to_array a) i)) o)
  (let ((o1 (add_one o acc)))
  (and
  (and (dynamic_invariant o1 true false true true)
  (= o1 (ite (= (choose o) true) (+ acc 1) acc)))
  (exists ((o2 element_out))
  (and (= (to_rep1 o2) o1)
  (exists ((r2 (Array Int element_out)))
  (and (= r2 (store r i o2))
  (and
  (let ((o3 (first1 a)))
  (and (in_range5 o3)
  (let ((o4 init))
  (and (dynamic_property 1 100 (first1 a) (last1 a))
  (let ((o5 (of_array (to_array a) (first1 a) (last1 a))))
  (let ((o6 (in_range3 o5 o4 o3)))
  (and
  (and (in_range__function_guard o6 o5 o4 o3)
  (= (= o6 true) (<= o4 (- o3 (first1 o5)))))
  (or (not (= o6 true))
  (let ((o7 init))
  (let ((temp___1215 (first1 a)))
  (and (and (<= (first1 a) temp___1215) (<= temp___1215 (last1 a)))
  (exists ((o8 Int))
  (and (= (to_rep (select (to_array a) temp___1215)) o8)
  (let ((o9 (add_one o8 o7)))
  (and
  (and (dynamic_invariant o9 true false true true)
  (= o9 (ite (= (choose o8) true) (+ o7 1) o7)))
  (let ((temp___1214 (first1 a)))
  (and
  (and (<= (to_rep r__first) temp___1214) (<= temp___1214 (to_rep r__last)))
  (exists ((o10 Int)) (= (to_rep1 (select r2 temp___1214)) o10)))))))))))))))))))
  (exists ((acc1 Int) (i1 Int))
  (and
  (and
  (and
  (= (in_range3 (of_array (to_array a) (first1 a) (last1 a)) init (first1 a)) true)
  (= (to_rep1 (select r1 (first1 a))) (add_one
                                      (to_rep
                                      (select (to_array a) (first1 a))) 
                                      init)))
  (and
  (forall ((k Int))
  (=> (and (<= (first1 a) k) (<= k i1))
  (=> (< (first1 a) k)
  (and
  (= (in_range3 (of_array (to_array a) (first1 a) (last1 a))
     (to_rep1 (select r1 (- k 1))) k) true)
  (= (to_rep1 (select r1 k)) (add_one (to_rep (select (to_array a) k))
                             (to_rep1 (select r1 (- k 1)))))))))
  (ite (= i1 (first1 a)) (= acc1 init)
  (= acc1 (to_rep1 (select r1 (- i1 1)))))))
  (and
  (= (and (ite (and
               (and (dynamic_property2 (first1 a) (last1 a) i1)
               (forall ((temp___1204 Int))
               (=>
               (and (<= (to_rep r__first) temp___1204)
               (<= temp___1204 (to_rep r__last)))
               (=>
               (or (< temp___1199 temp___1204)
               (or (< temp___1204 temp___1198) (< i1 temp___1204)))
               (= (select r1 temp___1204) (select r temp___1204))))))
               (dynamic_invariant3 acc1 true true true true))
          true false) (ite (and (<= (first1 a) i1) (<= i1 (last1 a))) true
                      false)) true)
  (and
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= i1 (last1 a)) false true))
  (ite (= spark__branch true)
  (and (in_range6 i1)
  (let ((o3 a))
  (= (in_range3 (of_array (to_array o3) (first1 o3) (last1 o3))
     (add_one (to_rep (select (to_array o3) i1)) acc1) (+ i1 1)) true)))
  (let ((o3 a))
  (= (in_range_last (of_array (to_array o3) (first1 o3) (last1 o3))
     (add_one (to_rep (select (to_array o3) (last1 o3))) acc1)) true)))))
  (exists ((o3 Int))
  (and (= (to_rep1 (select r1 i1)) o3)
  (exists ((acc2 Int)) (and (= acc2 o3) (= i1 temp___1199)))))))))))))))))))
  (= r1 r))))))
  (forall ((o Int))
  (=> (= (to_rep r__last) o)
  (forall ((o1 Int))
  (=> (= (to_rep r__first) o1)
  (forall
  ((test_higher_order3__my_count__count_left__acc__fold__result us_t1))
  (=>
  (= test_higher_order3__my_count__count_left__acc__fold__result (of_array1
                                                                 r1 o1 o))
  (forall ((o2 Bool))
  (=>
  (exists ((o3 Bool))
  (and
  (ite (= (first3
          test_higher_order3__my_count__count_left__acc__fold__result) 
  (first1 a))
  (= o3 (ite (= (last3
                test_higher_order3__my_count__count_left__acc__fold__result) 
        (last1 a)) true false))
  (= o3 false))
  (ite (= o3 true)
  (let ((o4 (first1 a)))
  (and (in_range5 o4)
  (let ((o5 init))
  (and (dynamic_property 1 100 (first1 a) (last1 a))
  (let ((o6 (of_array (to_array a) (first1 a) (last1 a))))
  (and (= o2 (in_range3 o6 o5 o4))
  (and (in_range__function_guard o2 o6 o5 o4)
  (= (= o2 true) (<= o5 (- o4 (first1 o6))))))))))) (= o2 false))))
  (=> (= o2 true)
  (let ((o3 init))
  (let ((temp___1219 (first1 a)))
  (=> (and (<= (first1 a) temp___1219) (<= temp___1219 (last1 a)))
  (forall ((o4 Int))
  (=> (= (to_rep (select (to_array a) temp___1219)) o4)
  (let ((o5 (add_one o4 o3)))
  (=> (forall ((o6 Int)) (choose__function_guard (choose o6) o6))
  (=>
  (and (dynamic_invariant o5 true false true true)
  (= o5 (ite (= (choose o4) true) (+ o3 1) o3)))
  (<= (first1 a) (last3
                 test_higher_order3__my_count__count_left__acc__fold__result)))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)

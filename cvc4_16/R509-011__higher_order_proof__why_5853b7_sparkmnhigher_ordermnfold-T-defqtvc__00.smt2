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

(declare-const first Int)

(declare-const last Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((my_index__ref 0))
(((my_index__refqtmk (my_index__content integer)))))
(define-fun my_index__ref_my_index__content__projection ((a my_index__ref)) integer 
  (my_index__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first1 Int))
  (! (= (slide a first1 first1) a) :pattern ((slide a first1 first1)) ))))

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

(declare-sort t 0)

(declare-fun first1 (t) integer)

(declare-fun last1 (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first1 (mk f l))) f) (= (to_rep (last1 (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first2 ((a us_t)) Int (to_rep (first1 (rt a))))

(define-fun last2 ((a us_t)) Int (to_rep (last1 (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first2 a) (last2 a))
                                  (+ (- (last2 a) (first2 a)) 1) 0))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first1 (rt x)))
                 (to_rep (last1 (rt x))) (elts y) (to_rep (first1 (rt y)))
                 (to_rep (last1 (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((my_array__ref 0))
(((my_array__refqtmk (my_array__content us_t)))))
(define-fun my_array__ref_my_array__content__projection ((a my_array__ref)) us_t 
  (my_array__content a))

(declare-fun ind_prop (us_t Int Int) Bool)

(declare-fun ind_prop__function_guard (Bool us_t Int Int) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const fst Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const lst Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= first last)) (dynamic_property 
                                     first last temp___expr_171)))

;; first__def_axiom
  (assert (= first fst))

;; last__def_axiom
  (assert (= last lst))

(define-fun dynamic_invariant2 ((temp___expr_178 us_t)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (not (= temp___skip_constant_175 true))
                                     (dynamic_property1 first last
                                     (first2 temp___expr_178)
                                     (last2 temp___expr_178))))

;; ind_prop__post_axiom
  (assert true)

(declare-fun final_prop (us_t Int) Bool)

(declare-fun final_prop__function_guard (Bool us_t Int) Bool)

;; final_prop__post_axiom
  (assert true)

(declare-fun f (Int Int) Int)

(declare-fun f__function_guard (Int Int Int) Bool)

;; f__post_axiom
  (assert
  (forall ((x Int) (i Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant i true
     true true true))
     (let ((result (f x i)))
     (=> (f__function_guard result x i) (dynamic_invariant result true false
     true true)))) :pattern ((f x i)) )))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__2__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const init Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const first3 Int)

(declare-const last3 Int)

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content integer)))))
(define-fun index_type__ref_index_type__content__2__projection ((a1 index_type__ref)) integer 
  (index_type__content a1))

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out))
  (and (<= (- 2147483648) (element_outqtint i))
  (<= (element_outqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (element_out element_out) Bool)

(declare-const dummy4 element_out)

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
  (forall ((x element_out)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int element_out))))))
(declare-fun slide1 ((Array Int element_out) Int
  Int) (Array Int element_out))

;; slide_eq
  (assert
  (forall ((a1 (Array Int element_out)))
  (forall ((first4 Int))
  (! (= (slide1 a1 first4 first4) a1) :pattern ((slide1 a1 first4 first4)) ))))

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

(declare-fun first4 (t1) integer)

(declare-fun last4 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f1 Int) (l Int))
  (! (=> (in_range1 f1)
     (=> (in_range1 l)
     (and (= (to_rep (first4 (mk1 f1 l))) f1)
     (= (to_rep (last4 (mk1 f1 l))) l)))) :pattern ((mk1 f1 l)) )))

(define-fun dynamic_property3 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (dynamic_property2 range_first range_last low)
                   (dynamic_property2 range_first range_last high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int element_out))(rt1 t1)))))
(define-fun to_array1 ((a1 us_t1)) (Array Int element_out) (elts1 a1))

(define-fun of_array1 ((a1 (Array Int element_out)) (f1 Int)
  (l Int)) us_t1 (us_tqtmk1 a1 (mk1 f1 l)))

(define-fun first5 ((a1 us_t1)) Int (to_rep (first4 (rt1 a1))))

(define-fun last5 ((a1 us_t1)) Int (to_rep (last4 (rt1 a1))))

(define-fun length1 ((a1 us_t1)) Int (ite (<= (first5 a1) (last5 a1))
                                     (+ (- (last5 a1) (first5 a1)) 1) 0))

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
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep (first4 (rt1 x)))
                  (to_rep (last4 (rt1 x))) (elts1 y)
                  (to_rep (first4 (rt1 y))) (to_rep (last4 (rt1 y)))))

(declare-fun user_eq5 (us_t1 us_t1) Bool)

(declare-const dummy5 us_t1)

(declare-datatypes ((acc_array__ref 0))
(((acc_array__refqtmk (acc_array__content us_t1)))))
(define-fun acc_array__ref_acc_array__content__projection ((a1 acc_array__ref)) us_t1 
  (acc_array__content a1))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r__first integer)

(declare-const r__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant3 ((temp___expr_235 Int)
  (temp___is_init_231 Bool) (temp___skip_constant_232 Bool)
  (temp___do_toplevel_233 Bool)
  (temp___do_typ_inv_234 Bool)) Bool (=>
                                     (or (= temp___is_init_231 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_235)))

(declare-datatypes ((trS__ref 0))
(((trS__refqtmk (trS__content us_t1)))))
(define-fun trS__ref_trS__content__projection ((a1 trS__ref)) us_t1 (trS__content
                                                                    a1))

(declare-datatypes ((t33s__ref 0))
(((t33s__refqtmk (t33s__content us_t1)))))
(define-fun t33s__ref_t33s__content__projection ((a1 t33s__ref)) us_t1 
  (t33s__content a1))

(define-fun dynamic_property4 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ((t34s__ref 0))
(((t34s__refqtmk (t34s__content integer)))))
(define-fun t34s__ref_t34s__content__projection ((a1 t34s__ref)) integer 
  (t34s__content a1))

(define-fun dynamic_invariant4 ((temp___expr_229 us_t)
  (temp___is_init_225 Bool) (temp___skip_constant_226 Bool)
  (temp___do_toplevel_227 Bool)
  (temp___do_typ_inv_228 Bool)) Bool (=>
                                     (not (= temp___skip_constant_226 true))
                                     (dynamic_property1 first last
                                     (first2 temp___expr_229)
                                     (last2 temp___expr_229))))

(declare-fun test_higher_order__my_fold_right__acc__fold__R31s__r__aggregate_def (Int
  Int Int) us_t1)

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((id x)) )))

;; fst__def_axiom
  (assert (and (id__function_guard (id 0) 0) (= fst (id 0))))

;; lst__def_axiom
  (assert (and (id__function_guard (id 100) 100) (= lst (id 100))))

(define-fun dynamic_invariant5 ((temp___expr_250 us_t1)
  (temp___is_init_246 Bool) (temp___skip_constant_247 Bool)
  (temp___do_toplevel_248 Bool)
  (temp___do_typ_inv_249 Bool)) Bool (=>
                                     (not (= temp___skip_constant_247 true))
                                     (dynamic_property3 first3 last3
                                     (first5 temp___expr_250)
                                     (last5 temp___expr_250))))

(define-fun dynamic_invariant6 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= first3 last3)) (dynamic_property2
                                     first3 last3 temp___expr_215)))

;; first__def_axiom
  (assert (= first3 fst))

;; last__def_axiom
  (assert (= last3 lst))

;; def_axiom
  (assert
  (forall ((temp___482 Int) (temp___483 Int) (temp___484 Int))
  (let ((temp___481 (test_higher_order__my_fold_right__acc__fold__R31s__r__aggregate_def
                    temp___482 temp___483 temp___484)))
  (=> (dynamic_invariant3 temp___482 true true true true)
  (and
  (=> (dynamic_property3 first3 last3 temp___483 temp___484)
  (and (= (first5 temp___481) temp___483) (= (last5 temp___481) temp___484)))
  (forall ((temp___485 Int))
  (= (to_rep1 (select (to_array1 temp___481) temp___485)) temp___482)))))))

(define-fun dynamic_invariant7 ((temp___expr_282 us_t1)
  (temp___is_init_278 Bool) (temp___skip_constant_279 Bool)
  (temp___do_toplevel_280 Bool)
  (temp___do_typ_inv_281 Bool)) Bool (=>
                                     (not (= temp___skip_constant_279 true))
                                     (and (dynamic_property3 (first2 a)
                                     (last2 a) (first5 temp___expr_282)
                                     (last5 temp___expr_282))
                                     (and
                                     (= (first5 temp___expr_282) (first2 a))
                                     (= (last5 temp___expr_282) (last2 a))))))

(define-fun default_initial_assumption ((temp___expr_284 us_t1)
  (temp___skip_top_level_285 Bool)) Bool (and
                                         (= (first5 temp___expr_284) 
                                         (first2 a))
                                         (= (last5 temp___expr_284) (last2 a))))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 255, characters 0-0
  (not
  (forall ((acc Int))
  (=> (dynamic_invariant4 a true false true true)
  (=> (dynamic_invariant3 init true false true true)
  (=> (< 0 (length a))
  (=> (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init (last2 a))
  (of_array (to_array a) (first2 a) (last2 a)) init (last2 a))
  (=>
  (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init (last2 a)) true)
  (=> (= acc init)
  (=> (dynamic_invariant3 acc true false true true)
  (let ((temp___486 (test_higher_order__my_fold_right__acc__fold__R31s__r__aggregate_def
                    init (first2 a) (last2 a))))
  (=> (= (first5 temp___486) (first2 a))
  (=> (= (last5 temp___486) (last2 a))
  (=>
  (ite (<= (first5 temp___486) (last5 temp___486))
  (and (<= (first2 a) (last2 a))
  (= (- (last5 temp___486) (first5 temp___486)) (- (last2 a) (first2 a))))
  (< (last2 a) (first2 a)))
  (let ((test_higher_order__my_fold_right__acc__fold__R31s__r__assume 
  (of_array1 (slide1 (to_array1 temp___486) (first5 temp___486) (first2 a))
  (first2 a) (last2 a))))
  (forall ((r (Array Int element_out)))
  (=>
  (= r (to_array1
       test_higher_order__my_fold_right__acc__fold__R31s__r__assume))
  (=>
  (= (to_rep r__first) (first5
                       test_higher_order__my_fold_right__acc__fold__R31s__r__assume))
  (=>
  (= (to_rep r__last) (last5
                      test_higher_order__my_fold_right__acc__fold__R31s__r__assume))
  (=>
  (and (dynamic_property3 (first2 a) (last2 a) (to_rep r__first)
  (to_rep r__last))
  (and (= (to_rep r__first) (first2 a)) (= (to_rep r__last) (last2 a))))
  (forall ((r1 (Array Int element_out)))
  (=>
  (forall ((acc1 Int) (i Int)) (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) acc1 i)
  (of_array (to_array a) (first2 a) (last2 a)) acc1 i))
  (=> (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init (last2 a))
  (of_array (to_array a) (first2 a) (last2 a)) init (last2 a))
  (=> (f__function_guard (f (to_rep (select (to_array a) (last2 a))) init)
  (to_rep (select (to_array a) (last2 a))) init)
  (=>
  (forall ((r2 (Array Int element_out)) (k Int)) (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a))
  (to_rep1 (select r2 (+ k 1))) k)
  (of_array (to_array a) (first2 a) (last2 a)) (to_rep1 (select r2 (+ k 1)))
  k))
  (=>
  (forall ((r2 (Array Int element_out)) (k Int)) (f__function_guard
  (f (to_rep (select (to_array a) k)) (to_rep1 (select r2 (+ k 1))))
  (to_rep (select (to_array a) k)) (to_rep1 (select r2 (+ k 1)))))
  (=>
  (forall ((acc1 Int) (i Int)) (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) acc1 i)
  (of_array (to_array a) (first2 a) (last2 a)) acc1 i))
  (=> (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init (last2 a))
  (of_array (to_array a) (first2 a) (last2 a)) init (last2 a))
  (=> (f__function_guard (f (to_rep (select (to_array a) (last2 a))) init)
  (to_rep (select (to_array a) (last2 a))) init)
  (=>
  (forall ((r2 (Array Int element_out)) (k Int)) (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a))
  (to_rep1 (select r2 (+ k 1))) k)
  (of_array (to_array a) (first2 a) (last2 a)) (to_rep1 (select r2 (+ k 1)))
  k))
  (=>
  (forall ((r2 (Array Int element_out)) (k Int)) (f__function_guard
  (f (to_rep (select (to_array a) k)) (to_rep1 (select r2 (+ k 1))))
  (to_rep (select (to_array a) k)) (to_rep1 (select r2 (+ k 1)))))
  (=>
  (forall ((acc1 Int) (i Int) (o us_t)) (f__function_guard
  (f (to_rep (select (to_array o) i)) acc1) (to_rep (select (to_array o) i))
  acc1))
  (=>
  (forall ((acc1 Int) (i Int) (o us_t)) (f__function_guard
  (f (to_rep (select (to_array o) i)) acc1) (to_rep (select (to_array o) i))
  acc1))
  (=>
  (forall ((acc1 Int) (i Int) (o us_t)) (ind_prop__function_guard
  (ind_prop (of_array (to_array o) (first2 o) (last2 o))
  (f (to_rep (select (to_array o) i)) acc1) (- i 1))
  (of_array (to_array o) (first2 o) (last2 o))
  (f (to_rep (select (to_array o) i)) acc1) (- i 1)))
  (=>
  (forall ((acc1 Int) (o us_t)) (f__function_guard
  (f (to_rep (select (to_array o) (first2 o))) acc1)
  (to_rep (select (to_array o) (first2 o))) acc1))
  (=>
  (forall ((acc1 Int) (o us_t)) (f__function_guard
  (f (to_rep (select (to_array o) (first2 o))) acc1)
  (to_rep (select (to_array o) (first2 o))) acc1))
  (=>
  (forall ((acc1 Int) (o us_t)) (final_prop__function_guard
  (final_prop (of_array (to_array o) (first2 o) (last2 o))
  (f (to_rep (select (to_array o) (first2 o))) acc1))
  (of_array (to_array o) (first2 o) (last2 o))
  (f (to_rep (select (to_array o) (first2 o))) acc1)))
  (=>
  (let ((temp___489 (first2 a)))
  (let ((temp___490 (last2 a)))
  (exists ((i Int))
  (and (= i temp___490)
  (ite (= (and (ite (<= temp___489 i) true false) (ite (<= i temp___490) true
                                                  false)) true)
  (and (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) acc i) true)
  (exists ((o Int))
  (and (= (to_rep (select (to_array a) i)) o)
  (let ((o1 (f o acc)))
  (and
  (and (f__function_guard o1 o acc) (dynamic_invariant o1 true false true
  true))
  (exists ((o2 element_out))
  (and (= (to_rep1 o2) o1)
  (exists ((r2 (Array Int element_out)))
  (and (= r2 (store r i o2))
  (and
  (let ((temp___507 (last2 a)))
  (and (dynamic_property first last temp___507)
  (let ((o3 init))
  (let ((o4 (of_array (to_array a) (first2 a) (last2 a))))
  (let ((o5 (ind_prop o4 o3 temp___507)))
  (and (ind_prop__function_guard o5 o4 o3 temp___507)
  (or (not (= o5 true))
  (let ((o6 init))
  (let ((temp___509 (last2 a)))
  (and (and (<= (first2 a) temp___509) (<= temp___509 (last2 a)))
  (exists ((o7 Int))
  (and (= (to_rep (select (to_array a) temp___509)) o7)
  (let ((o8 (f o7 o6)))
  (and
  (and (f__function_guard o8 o7 o6) (dynamic_invariant o8 true false true
  true))
  (let ((temp___508 (last2 a)))
  (and
  (and (<= (to_rep r__first) temp___508) (<= temp___508 (to_rep r__last)))
  (exists ((o9 Int)) (= (to_rep1 (select r2 temp___508)) o9))))))))))))))))))
  (exists ((acc1 Int) (i1 Int))
  (and
  (and
  (and
  (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init (last2 a)) true)
  (= (to_rep1 (select r1 (last2 a))) (f
                                     (to_rep (select (to_array a) (last2 a)))
                                     init)))
  (and
  (forall ((k Int))
  (=> (and (<= i1 k) (<= k (last2 a)))
  (=> (< k (last2 a))
  (and
  (= (ind_prop (of_array (to_array a) (first2 a) (last2 a))
     (to_rep1 (select r1 (+ k 1))) k) true)
  (= (to_rep1 (select r1 k)) (f (to_rep (select (to_array a) k))
                             (to_rep1 (select r1 (+ k 1)))))))))
  (ite (= i1 (last2 a)) (= acc1 init)
  (= acc1 (to_rep1 (select r1 (+ i1 1)))))))
  (and
  (= (and (ite (and
               (and
               (forall ((temp___494 Int))
               (=>
               (and (<= (to_rep r__first) temp___494)
               (<= temp___494 (to_rep r__last)))
               (=>
               (or (< temp___490 temp___494)
               (or (< temp___494 temp___489) (< temp___494 i1)))
               (= (select r1 temp___494) (select r temp___494)))))
               (dynamic_invariant3 acc1 true true true true))
               (dynamic_property4 (first2 a) (last2 a) i1))
          true false) (ite (and (<= (first2 a) i1) (<= i1 (last2 a))) true
                      false)) true)
  (and
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= i1 (first2 a)) false true))
  (ite (= spark__branch true)
  (and (dynamic_property2 first3 last3 i1)
  (let ((o3 a))
  (= (ind_prop (of_array (to_array o3) (first2 o3) (last2 o3))
     (f (to_rep (select (to_array o3) i1)) acc1) (- i1 1)) true)))
  (let ((o3 a))
  (= (final_prop (of_array (to_array o3) (first2 o3) (last2 o3))
     (f (to_rep (select (to_array o3) (first2 o3))) acc1)) true)))))
  (exists ((o3 Int))
  (and (= (to_rep1 (select r1 i1)) o3)
  (exists ((acc2 Int)) (and (= acc2 o3) (= i1 temp___489)))))))))))))))))))
  (= r1 r))))))
  (forall ((o Int))
  (=> (= (to_rep r__last) o)
  (forall ((o1 Int))
  (=> (= (to_rep r__first) o1)
  (forall ((test_higher_order__my_fold_right__acc__fold__result us_t1))
  (=>
  (= test_higher_order__my_fold_right__acc__fold__result (of_array1 r1 o1 o))
  (=>
  (forall ((test_higher_order__my_fold_right__acc__fold__result1 us_t1))
  (final_prop__function_guard
  (final_prop (of_array (to_array a) (first2 a) (last2 a))
  (to_rep1
  (select (to_array1 test_higher_order__my_fold_right__acc__fold__result1) 
  (first2 a)))) (of_array (to_array a) (first2 a) (last2 a))
  (to_rep1
  (select (to_array1 test_higher_order__my_fold_right__acc__fold__result1) 
  (first2 a)))))
  (= (final_prop (of_array (to_array a) (first2 a) (last2 a))
     (to_rep1
     (select (to_array1 test_higher_order__my_fold_right__acc__fold__result) 
     (first2 a)))) true))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)

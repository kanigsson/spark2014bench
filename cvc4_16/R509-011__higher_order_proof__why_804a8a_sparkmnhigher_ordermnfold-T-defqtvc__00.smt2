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

(declare-fun value (Int) Int)

(declare-fun value__function_guard (Int Int) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort my_small 0)

(declare-fun my_smallqtint (my_small) Int)

;; my_small'axiom
  (assert
  (forall ((i my_small))
  (and (<= (- 100) (my_smallqtint i)) (<= (my_smallqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 100) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (my_small my_small) Bool)

(declare-const dummy1 my_small)

(declare-datatypes ((my_small__ref 0))
(((my_small__refqtmk (my_small__content my_small)))))
(define-fun my_small__ref_my_small__content__projection ((a my_small__ref)) my_small 
  (my_small__content a))

(define-fun dynamic_invariant1 ((temp___expr_196 Int)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (or (= temp___is_init_192 true)
                                     (<= (- 100) 100)) (in_range2
                                     temp___expr_196)))

;; value__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (value x)))
     (=> (value__function_guard result x) (dynamic_invariant1 result true
     false true true)))) :pattern ((value x)) )))

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

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (small_index small_index) Bool)

(declare-const dummy2 small_index)

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
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((small_array__ref 0))
(((small_array__refqtmk (small_array__content us_t)))))
(define-fun small_array__ref_small_array__content__projection ((a small_array__ref)) us_t 
  (small_array__content a))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-datatypes ((array_type__ref1 0))
(((array_type__refqtmk1 (array_type__content1 us_t)))))
(define-fun array_type__ref_array_type__content__3__projection ((a array_type__ref1)) us_t 
  (array_type__content1 a))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_type index_type) Bool)

(declare-const dummy4 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__3__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out))
  (and (<= (- 2147483648) (element_outqtint i))
  (<= (element_outqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (element_out element_out) Bool)

(declare-const dummy5 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__3__projection ((a element_out__ref)) element_out 
  (element_out__content a))

(define-fun to_rep1 ((x element_out)) Int (element_outqtint x))

(declare-fun of_rep1 (Int) element_out)

;; inversion_axiom
  (assert
  (forall ((x element_out))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element_out)) (! (in_range5
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int element_out))))))
(declare-fun slide1 ((Array Int element_out) Int
  Int) (Array Int element_out))

;; slide_eq
  (assert
  (forall ((a (Array Int element_out)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_out)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int element_out)) (a__first Int)
  (a__last Int) (b (Array Int element_out)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_166 Int))
                           (=>
                           (and (<= a__first temp___idx_166)
                           (<= temp___idx_166 a__last))
                           (= (to_rep1 (select a temp___idx_166)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_166)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int element_out)) (b (Array Int element_out)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_166 Int))
  (=> (and (<= a__first temp___idx_166) (<= temp___idx_166 a__last))
  (= (to_rep1 (select a temp___idx_166)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_166)))))))))))

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
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int element_out))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int element_out) (elts1 a))

(define-fun of_array1 ((a (Array Int element_out)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

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

(declare-fun user_eq6 (us_t1 us_t1) Bool)

(declare-const dummy6 us_t1)

(declare-datatypes ((acc_array__ref 0))
(((acc_array__refqtmk (acc_array__content us_t1)))))
(define-fun acc_array__ref_acc_array__content__projection ((a acc_array__ref)) us_t1 
  (acc_array__content a))

(declare-fun fold (us_t Int) us_t1)

(declare-fun fold__function_guard (us_t1 us_t Int) Bool)

(declare-fun in_range6 (us_t Int Int) Bool)

(declare-fun in_range__function_guard (Bool us_t Int Int) Bool)

(declare-fun in_range_last (us_t Int) Bool)

(declare-fun in_range_last__function_guard (Bool us_t Int) Bool)

;; temp___result_165'def
  (assert (forall ((x Int)) (value__function_guard (value x) x)))

(define-fun add_value ((x Int) (y Int)) Int (+ (value x) y))

(declare-fun add_value__function_guard (Int Int Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_295 Int)
  (temp___is_init_291 Bool) (temp___skip_constant_292 Bool)
  (temp___do_toplevel_293 Bool)
  (temp___do_typ_inv_294 Bool)) Bool (=>
                                     (or (= temp___is_init_291 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_295)))

(define-fun dynamic_invariant3 ((temp___expr_308 us_t1)
  (temp___is_init_304 Bool) (temp___skip_constant_305 Bool)
  (temp___do_toplevel_306 Bool)
  (temp___do_typ_inv_307 Bool)) Bool (=>
                                     (not (= temp___skip_constant_305 true))
                                     (dynamic_property1 1 100
                                     (first3 temp___expr_308)
                                     (last3 temp___expr_308))))

(define-fun dynamic_invariant4 ((temp___expr_289 us_t)
  (temp___is_init_285 Bool) (temp___skip_constant_286 Bool)
  (temp___do_toplevel_287 Bool)
  (temp___do_typ_inv_288 Bool)) Bool (=>
                                     (not (= temp___skip_constant_286 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_289)
                                     (last1 temp___expr_289))))

;; fold__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((init Int))
  (! (and
     (forall ((a1 us_t) (init1 Int)) (in_range__function_guard
     (in_range6 (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)) (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)))
     (=>
     (and
     (and (dynamic_invariant4 a true true true true) (dynamic_invariant2 init
     true true true true))
     (and (< 0 (length a))
     (= (in_range6 (of_array (to_array a) (first1 a) (last1 a)) init
        (first1 a)) true)))
     (let ((result (fold a init)))
     (and
     (forall ((a1 us_t) (init1 Int)) (in_range__function_guard
     (in_range6 (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)) (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)))
     (and
     (forall ((a1 us_t) (result1 us_t1) (i Int)) (in_range__function_guard
     (in_range6 (of_array (to_array a1) (first1 a1) (last1 a1))
     (to_rep1 (select (to_array1 result1) (- i 1))) i)
     (of_array (to_array a1) (first1 a1) (last1 a1))
     (to_rep1 (select (to_array1 result1) (- i 1))) i))
     (and
     (forall ((a1 us_t) (result1 us_t1)) (in_range_last__function_guard
     (in_range_last (of_array (to_array a1) (first1 a1) (last1 a1))
     (to_rep1 (select (to_array1 result1) (last1 a1))))
     (of_array (to_array a1) (first1 a1) (last1 a1))
     (to_rep1 (select (to_array1 result1) (last1 a1)))))
     (=> (fold__function_guard result a init)
     (and
     (and
     (and
     (and
     (and (and (= (first3 result) (first1 a)) (= (last3 result) (last1 a)))
     (= (in_range6 (of_array (to_array a) (first1 a) (last1 a)) init
        (first1 a)) true))
     (= (to_rep1 (select (to_array1 result) (first1 a))) (add_value
                                                         (to_rep
                                                         (select (to_array a) 
                                                         (first1 a))) init)))
     (forall ((i Int))
     (=> (and (<= (first1 a) i) (<= i (last1 a)))
     (=> (< (first1 a) i)
     (and
     (= (in_range6 (of_array (to_array a) (first1 a) (last1 a))
        (to_rep1 (select (to_array1 result) (- i 1))) i) true)
     (= (to_rep1 (select (to_array1 result) i)) (add_value
                                                (to_rep
                                                (select (to_array a) i))
                                                (to_rep1
                                                (select (to_array1 result) (- i 1))))))))))
     (= (in_range_last (of_array (to_array a) (first1 a) (last1 a))
        (to_rep1 (select (to_array1 result) (last1 a)))) true))
     (dynamic_invariant3 result true false true true))))))))) :pattern (
  (fold a init)) ))))

(declare-fun sum (us_t) Int)

(declare-fun sum__function_guard (Int us_t) Bool)

(declare-datatypes ((array_type__ref2 0))
(((array_type__refqtmk2 (array_type__content2 us_t)))))
(define-fun array_type__ref_array_type__content__2__projection ((a array_type__ref2)) us_t 
  (array_type__content2 a))

(declare-fun fold1 (us_t Int) Int)

(declare-fun fold__function_guard1 (Int us_t Int) Bool)

(define-fun dynamic_invariant5 ((temp___expr_230 us_t)
  (temp___is_init_226 Bool) (temp___skip_constant_227 Bool)
  (temp___do_toplevel_228 Bool)
  (temp___do_typ_inv_229 Bool)) Bool (=>
                                     (not (= temp___skip_constant_227 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_230)
                                     (last1 temp___expr_230))))

;; sum__post_axiom
  (assert
  (forall ((a us_t))
  (! (=> (dynamic_invariant5 a true true true true)
     (let ((result (sum a)))
     (=> (sum__function_guard result a) (dynamic_invariant result true false
     true true)))) :pattern ((sum a)) )))

;; sum__def_axiom
  (assert
  (forall ((a us_t))
  (! (=> (dynamic_invariant5 a true true true true)
     (and
     (forall ((a1 us_t)) (fold__function_guard1
     (fold1 (of_array (to_array a1) (first1 a1) (last1 a1)) 0)
     (of_array (to_array a1) (first1 a1) (last1 a1)) 0))
     (= (sum a) (fold1 (of_array (to_array a) (first1 a) (last1 a)) 0)))) :pattern (
  (sum a)) )))

(declare-const a1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const a2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun in_range7 (us_t Int) Bool)

(declare-fun in_range__function_guard1 (Bool us_t Int) Bool)

(declare-sort index_type1 0)

(declare-fun index_typeqtint1 (index_type1) Int)

;; index_type'axiom
  (assert
  (forall ((i1 index_type1))
  (and (<= 1 (index_typeqtint1 i1)) (<= (index_typeqtint1 i1) 100))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (index_type1 index_type1) Bool)

(declare-const dummy7 index_type1)

(declare-datatypes ((index_type__ref1 0))
(((index_type__refqtmk1 (index_type__content1 index_type1)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref1)) index_type1 
  (index_type__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_210 Int)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (<= 1 100)) (in_range8 temp___expr_210)))

;; in_range__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((k Int))
  (! (=>
     (and
     (and (dynamic_invariant5 a true true true true) (dynamic_invariant6 k
     true true true true))
     (and (and (<= (first1 a) k) (<= k (last1 a)))
     (and (<= (first1 a) i) (<= i (last1 a)))))
     (let ((result (in_range7 a k)))
     (and
     (forall ((a3 us_t)) (value__function_guard
     (value (to_rep (select (to_array a3) i)))
     (to_rep (select (to_array a3) i))))
     (and
     (forall ((a3 us_t)) (value__function_guard
     (value (to_rep (select (to_array a3) i)))
     (to_rep (select (to_array a3) i))))
     (and
     (forall ((a3 us_t)) (fold__function_guard
     (fold (of_array (to_array a3) (first1 a3) (last1 a3)) 0)
     (of_array (to_array a3) (first1 a3) (last1 a3)) 0))
     (and
     (forall ((a3 us_t)) (fold__function_guard
     (fold (of_array (to_array a3) (first1 a3) (last1 a3)) 0)
     (of_array (to_array a3) (first1 a3) (last1 a3)) 0))
     (and
     (forall ((a3 us_t)) (value__function_guard
     (value (to_rep (select (to_array a3) i)))
     (to_rep (select (to_array a3) i))))
     (=> (in_range__function_guard1 result a k)
     (=> (= result true)
     (=> (< i k)
     (ite (<= 0 (value (to_rep (select (to_array a) i))))
     (<= (+ (- 2147483648) (value (to_rep (select (to_array a) i)))) 
     (to_rep1
     (let ((temp___439 (fold (of_array (to_array a) (first1 a) (last1 a)) 0)))
     (select (to_array1 temp___439) k))))
     (<= (to_rep1
         (let ((temp___442 (fold (of_array (to_array a) (first1 a) (last1 a))
                           0)))
         (select (to_array1 temp___442) k))) (+ 2147483647 (value
                                                           (to_rep
                                                           (select (to_array
                                                                   a) 
                                                           i)))))))))))))))) :pattern (
  (in_range7 a k)) ))))

;; in_range__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((k Int))
  (! (and
     (forall ((a3 us_t)) (fold__function_guard
     (fold (of_array (to_array a3) (first1 a3) (last1 a3)) 0)
     (of_array (to_array a3) (first1 a3) (last1 a3)) 0))
     (and
     (forall ((a3 us_t)) (fold__function_guard
     (fold (of_array (to_array a3) (first1 a3) (last1 a3)) 0)
     (of_array (to_array a3) (first1 a3) (last1 a3)) 0))
     (and
     (forall ((a3 us_t)) (value__function_guard
     (value (to_rep (select (to_array a3) i)))
     (to_rep (select (to_array a3) i))))
     (and
     (forall ((a3 us_t)) (value__function_guard
     (value (to_rep (select (to_array a3) i)))
     (to_rep (select (to_array a3) i))))
     (= (= (in_range7 a k) true)
     (ite (< k i)
     (let ((temp___447 (to_rep1
                       (let ((temp___446 (fold
                                         (of_array (to_array a) (first1 a)
                                         (last1 a)) 0)))
                       (select (to_array1 temp___446) k)))))
     (and (<= (* (- 100) (+ (- k (first1 a)) 1)) temp___447)
     (<= temp___447 (* 100 (+ (- k (first1 a)) 1)))))
     (let ((temp___450 (to_rep1
                       (let ((temp___449 (fold
                                         (of_array (to_array a) (first1 a)
                                         (last1 a)) 0)))
                       (select (to_array1 temp___449) k)))))
     (and
     (<= (+ (value (to_rep (select (to_array a) i))) (* (- 100) (- k 
     (first1 a)))) temp___450)
     (<= temp___450 (+ (value (to_rep (select (to_array a) i))) (* 100 (- k 
     (first1 a))))))))))))) :pattern ((in_range7 a k)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ((t55s__ref 0))
(((t55s__refqtmk (t55s__content integer)))))
(define-fun t55s__ref_t55s__content__projection ((a t55s__ref)) integer 
  (t55s__content a))

(define-fun dynamic_invariant7 ((temp___expr_203 Int)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (or (= temp___is_init_199 true)
                                     (<= 1 100)) (in_range3 temp___expr_203)))

;; in_range__post_axiom
  (assert true)

;; in_range__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int) (i1 Int))
  (! (= (= (in_range6 a x i1) true)
     (and (<= (* (- 100) (- i1 (first1 a))) x)
     (<= x (* 100 (- i1 (first1 a)))))) :pattern ((in_range6 a x i1)) ))))

;; in_range_last__post_axiom
  (assert true)

;; in_range_last__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int))
  (! (= (= (in_range_last a x) true)
     (and (<= (* (- 100) (length a)) x) (<= x (* 100 (length a))))) :pattern (
  (in_range_last a x)) ))))

(declare-sort element_out1 0)

(declare-fun element_outqtint1 (element_out1) Int)

;; element_out'axiom
  (assert
  (forall ((i1 element_out1))
  (and (<= (- 2147483648) (element_outqtint1 i1))
  (<= (element_outqtint1 i1) 2147483647))))

(define-fun in_range9 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq9 (element_out1 element_out1) Bool)

(declare-const dummy9 element_out1)

(declare-datatypes ((element_out__ref1 0))
(((element_out__refqtmk1 (element_out__content1 element_out1)))))
(define-fun element_out__ref_element_out__content__2__projection ((a element_out__ref1)) element_out1 
  (element_out__content1 a))

(define-fun dynamic_invariant8 ((temp___expr_268 Int)
  (temp___is_init_264 Bool) (temp___skip_constant_265 Bool)
  (temp___do_toplevel_266 Bool)
  (temp___do_typ_inv_267 Bool)) Bool (=>
                                     (or (= temp___is_init_264 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range9 temp___expr_268)))

(define-fun dynamic_invariant9 ((temp___expr_262 us_t)
  (temp___is_init_258 Bool) (temp___skip_constant_259 Bool)
  (temp___do_toplevel_260 Bool)
  (temp___do_typ_inv_261 Bool)) Bool (=>
                                     (not (= temp___skip_constant_259 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_262)
                                     (last1 temp___expr_262))))

;; fold__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((init Int))
  (! (and
     (forall ((a3 us_t) (init1 Int)) (in_range__function_guard
     (in_range6 (of_array (to_array a3) (first1 a3) (last1 a3)) init1
     (first1 a3)) (of_array (to_array a3) (first1 a3) (last1 a3)) init1
     (first1 a3)))
     (=>
     (and
     (and (dynamic_invariant9 a true true true true) (dynamic_invariant8 init
     true true true true))
     (or (= (length a) 0)
     (= (in_range6 (of_array (to_array a) (first1 a) (last1 a)) init
        (first1 a)) true)))
     (let ((result (fold1 a init)))
     (and
     (forall ((a3 us_t) (init1 Int)) (fold__function_guard
     (fold (of_array (to_array a3) (first1 a3) (last1 a3)) init1)
     (of_array (to_array a3) (first1 a3) (last1 a3)) init1))
     (=> (fold__function_guard1 result a init)
     (and
     (= result (ite (= (length a) 0) init
               (to_rep1
               (let ((temp___368 (fold
                                 (of_array (to_array a) (first1 a) (last1 a))
                                 init)))
               (select (to_array1 temp___368) (last1 a))))))
     (dynamic_invariant8 result true false true true))))))) :pattern (
  (fold1 a init)) ))))

(define-fun dynamic_invariant10 ((temp___expr_275 Int)
  (temp___is_init_271 Bool) (temp___skip_constant_272 Bool)
  (temp___do_toplevel_273 Bool)
  (temp___do_typ_inv_274 Bool)) Bool (=>
                                     (or (= temp___is_init_271 true)
                                     (<= 1 100)) (in_range4 temp___expr_275)))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 351, characters 0-0
  (not
  (=> (dynamic_invariant5 a1 true false true true)
  (=> (dynamic_invariant5 a2 true false true true)
  (=> (dynamic_invariant6 i true false true true)
  (=> (<= (first1 a1) i)
  (=> (<= i (last1 a1))
  (=> (= (first1 a1) (first1 a2))
  (=> (= (last1 a1) (last1 a2))
  (=>
  (forall ((k Int))
  (=> (and (<= (first1 a1) k) (<= k (last1 a1)))
  (=> (not (= k i))
  (= (to_rep (select (to_array a1) k)) (to_rep (select (to_array a2) k))))))
  (let ((temp___673 (first1 a1)))
  (forall ((k Int))
  (=> (= k temp___673)
  (=>
  (= (and (ite (<= temp___673 k) true false) (ite (<= k (last1 a1)) true
                                             false)) true)
  (=> (in_range8 k)
  (let ((o a1))
  (let ((temp___inv_693 (in_range7 o k)))
  (=>
  (forall ((o1 us_t)) (fold__function_guard
  (fold (of_array (to_array o1) (first1 o1) (last1 o1)) 0)
  (of_array (to_array o1) (first1 o1) (last1 o1)) 0))
  (=>
  (forall ((o1 us_t)) (fold__function_guard
  (fold (of_array (to_array o1) (first1 o1) (last1 o1)) 0)
  (of_array (to_array o1) (first1 o1) (last1 o1)) 0))
  (=>
  (forall ((o1 us_t)) (value__function_guard
  (value (to_rep (select (to_array o1) i)))
  (to_rep (select (to_array o1) i))))
  (=>
  (forall ((o1 us_t)) (value__function_guard
  (value (to_rep (select (to_array o1) i)))
  (to_rep (select (to_array o1) i))))
  (=>
  (forall ((o1 us_t)) (value__function_guard
  (value (to_rep (select (to_array o1) i)))
  (to_rep (select (to_array o1) i))))
  (=>
  (forall ((o1 us_t)) (value__function_guard
  (value (to_rep (select (to_array o1) i)))
  (to_rep (select (to_array o1) i))))
  (=>
  (forall ((o1 us_t)) (fold__function_guard
  (fold (of_array (to_array o1) (first1 o1) (last1 o1)) 0)
  (of_array (to_array o1) (first1 o1) (last1 o1)) 0))
  (=>
  (forall ((o1 us_t)) (fold__function_guard
  (fold (of_array (to_array o1) (first1 o1) (last1 o1)) 0)
  (of_array (to_array o1) (first1 o1) (last1 o1)) 0))
  (=>
  (forall ((o1 us_t)) (value__function_guard
  (value (to_rep (select (to_array o1) i)))
  (to_rep (select (to_array o1) i))))
  (=>
  (and (in_range__function_guard1 temp___inv_693 o k)
  (and
  (= (= temp___inv_693 true)
  (ite (< k i)
  (let ((temp___432 (to_rep1
                    (select (to_array1
                            (fold
                            (of_array (to_array o) (first1 o) (last1 o)) 0)) k))))
  (and (<= (* (- 100) (+ (- k (first1 o)) 1)) temp___432)
  (<= temp___432 (* 100 (+ (- k (first1 o)) 1)))))
  (let ((temp___435 (to_rep1
                    (select (to_array1
                            (fold
                            (of_array (to_array o) (first1 o) (last1 o)) 0)) k))))
  (and
  (<= (+ (value (to_rep (select (to_array o) i))) (* (- 100) (- k (first1 o)))) temp___435)
  (<= temp___435 (+ (value (to_rep (select (to_array o) i))) (* 100 (- k 
  (first1 o)))))))))
  (=> (= temp___inv_693 true)
  (=> (< i k)
  (ite (<= 0 (value (to_rep (select (to_array o) i))))
  (<= (+ (- 2147483648) (value (to_rep (select (to_array o) i)))) (to_rep1
                                                                  (select 
                                                                  (to_array1
                                                                  (fold
                                                                  (of_array
                                                                  (to_array
                                                                  o)
                                                                  (first1 o)
                                                                  (last1 o))
                                                                  0)) k)))
  (<= (to_rep1
      (select (to_array1
              (fold (of_array (to_array o) (first1 o) (last1 o)) 0)) k)) (+ 2147483647 
  (value (to_rep (select (to_array o) i))))))))))
  (=> (in_range8 k) (<= (first1 a2) k)))))))))))))))))))))))))))))
(check-sat)
(exit)

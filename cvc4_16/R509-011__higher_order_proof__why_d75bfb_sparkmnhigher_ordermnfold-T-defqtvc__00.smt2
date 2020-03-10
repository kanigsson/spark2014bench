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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-fun choose (Int) Bool)

(declare-fun choose__function_guard (Bool Int) Bool)

;; choose__post_axiom
  (assert true)

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

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (index_type index_type) Bool)

(declare-const dummy3 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__3__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out))
  (and (<= 0 (element_outqtint i)) (<= (element_outqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (element_out element_out) Bool)

(declare-const dummy4 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__2__projection ((a element_out__ref)) element_out 
  (element_out__content a))

(define-fun to_rep1 ((x element_out)) Int (element_outqtint x))

(declare-fun of_rep1 (Int) element_out)

;; inversion_axiom
  (assert
  (forall ((x element_out))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element_out)) (! (in_range4
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
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
                           (forall ((temp___idx_161 Int))
                           (=>
                           (and (<= a__first temp___idx_161)
                           (<= temp___idx_161 a__last))
                           (= (to_rep1 (select a temp___idx_161)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_161)))))))
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
  (forall ((temp___idx_161 Int))
  (=> (and (<= a__first temp___idx_161) (<= temp___idx_161 a__last))
  (= (to_rep1 (select a temp___idx_161)) (to_rep1
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
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int element_out))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int element_out) (elts1 a))

(define-fun of_array1 ((a (Array Int element_out)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep (last2 (rt1 a))))

(define-fun length2 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
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

(declare-fun user_eq5 (us_t1 us_t1) Bool)

(declare-const dummy5 us_t1)

(declare-datatypes ((acc_array__ref 0))
(((acc_array__refqtmk (acc_array__content us_t1)))))
(define-fun acc_array__ref_acc_array__content__projection ((a acc_array__ref)) us_t1 
  (acc_array__content a))

(declare-fun fold (us_t Int) us_t1)

(declare-fun fold__function_guard (us_t1 us_t Int) Bool)

(declare-fun in_range5 (us_t Int Int) Bool)

(declare-fun in_range__function_guard (Bool us_t Int Int) Bool)

(declare-fun in_range_last (us_t Int) Bool)

(declare-fun in_range_last__function_guard (Bool us_t Int) Bool)

;; temp___result_160'def
  (assert (forall ((e Int)) (choose__function_guard (choose e) e)))

(define-fun add_one ((e Int)
  (x Int)) Int (ite (= (choose e) true) (+ x 1) x))

(declare-fun add_one__function_guard (Int Int Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_295 Int)
  (temp___is_init_291 Bool) (temp___skip_constant_292 Bool)
  (temp___do_toplevel_293 Bool)
  (temp___do_typ_inv_294 Bool)) Bool (=>
                                     (or (= temp___is_init_291 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_295)))

(define-fun dynamic_invariant2 ((temp___expr_308 us_t1)
  (temp___is_init_304 Bool) (temp___skip_constant_305 Bool)
  (temp___do_toplevel_306 Bool)
  (temp___do_typ_inv_307 Bool)) Bool (=>
                                     (not (= temp___skip_constant_305 true))
                                     (dynamic_property1 1 100
                                     (first3 temp___expr_308)
                                     (last3 temp___expr_308))))

(define-fun dynamic_invariant3 ((temp___expr_289 us_t)
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
     (in_range5 (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)) (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)))
     (=>
     (and
     (and (dynamic_invariant3 a true true true true) (dynamic_invariant1 init
     true true true true))
     (and (< 0 (length1 a))
     (= (in_range5 (of_array (to_array a) (first1 a) (last1 a)) init
        (first1 a)) true)))
     (let ((result (fold a init)))
     (and
     (forall ((a1 us_t) (init1 Int)) (in_range__function_guard
     (in_range5 (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)) (of_array (to_array a1) (first1 a1) (last1 a1)) init1
     (first1 a1)))
     (and
     (forall ((a1 us_t) (result1 us_t1) (i Int)) (in_range__function_guard
     (in_range5 (of_array (to_array a1) (first1 a1) (last1 a1))
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
     (= (in_range5 (of_array (to_array a) (first1 a) (last1 a)) init
        (first1 a)) true))
     (= (to_rep1 (select (to_array1 result) (first1 a))) (add_one
                                                         (to_rep
                                                         (select (to_array a) 
                                                         (first1 a))) init)))
     (forall ((i Int))
     (=> (and (<= (first1 a) i) (<= i (last1 a)))
     (=> (< (first1 a) i)
     (and
     (= (in_range5 (of_array (to_array a) (first1 a) (last1 a))
        (to_rep1 (select (to_array1 result) (- i 1))) i) true)
     (= (to_rep1 (select (to_array1 result) i)) (add_one
                                                (to_rep
                                                (select (to_array a) i))
                                                (to_rep1
                                                (select (to_array1 result) (- i 1))))))))))
     (= (in_range_last (of_array (to_array a) (first1 a) (last1 a))
        (to_rep1 (select (to_array1 result) (last1 a)))) true))
     (dynamic_invariant2 result true false true true))))))))) :pattern (
  (fold a init)) ))))

(declare-fun count (us_t) Int)

(declare-fun count__function_guard (Int us_t) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (natural natural) Bool)

(declare-const dummy6 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant4 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range6
                                    temp___expr_39)))

(declare-datatypes ((array_type__ref2 0))
(((array_type__refqtmk2 (array_type__content2 us_t)))))
(define-fun array_type__ref_array_type__content__2__projection ((a array_type__ref2)) us_t 
  (array_type__content2 a))

(declare-fun fold1 (us_t Int) Int)

(declare-fun fold__function_guard1 (Int us_t Int) Bool)

(define-fun dynamic_invariant5 ((temp___expr_237 us_t)
  (temp___is_init_233 Bool) (temp___skip_constant_234 Bool)
  (temp___do_toplevel_235 Bool)
  (temp___do_typ_inv_236 Bool)) Bool (=>
                                     (not (= temp___skip_constant_234 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_237)
                                     (last1 temp___expr_237))))

;; count__post_axiom
  (assert
  (forall ((a us_t))
  (! (=> (dynamic_invariant5 a true true true true)
     (let ((result (count a)))
     (=> (count__function_guard result a) (dynamic_invariant4 result true
     false true true)))) :pattern ((count a)) )))

;; count__def_axiom
  (assert
  (forall ((a us_t))
  (! (=> (dynamic_invariant5 a true true true true)
     (and
     (forall ((a1 us_t)) (fold__function_guard1
     (fold1 (of_array (to_array a1) (first1 a1) (last1 a1)) 0)
     (of_array (to_array a1) (first1 a1) (last1 a1)) 0))
     (= (count a) (fold1 (of_array (to_array a) (first1 a) (last1 a)) 0)))) :pattern (
  (count a)) )))

(declare-const a1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const a2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort index_type1 0)

(declare-fun index_typeqtint1 (index_type1) Int)

;; index_type'axiom
  (assert
  (forall ((i1 index_type1))
  (and (<= 1 (index_typeqtint1 i1)) (<= (index_typeqtint1 i1) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (index_type1 index_type1) Bool)

(declare-const dummy7 index_type1)

(declare-datatypes ((index_type__ref1 0))
(((index_type__refqtmk1 (index_type__content1 index_type1)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref1)) index_type1 
  (index_type__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_217 Int)
  (temp___is_init_213 Bool) (temp___skip_constant_214 Bool)
  (temp___do_toplevel_215 Bool)
  (temp___do_typ_inv_216 Bool)) Bool (=>
                                     (or (= temp___is_init_213 true)
                                     (<= 1 100)) (in_range7 temp___expr_217)))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ((t116s__ref 0))
(((t116s__refqtmk (t116s__content integer)))))
(define-fun t116s__ref_t116s__content__projection ((a t116s__ref)) integer 
  (t116s__content a))

(define-fun dynamic_invariant7 ((temp___expr_210 Int)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (<= 1 100)) (in_range2 temp___expr_210)))

;; in_range__post_axiom
  (assert true)

;; in_range__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int) (i1 Int))
  (! (= (= (in_range5 a x i1) true) (<= x (- i1 (first1 a)))) :pattern (
  (in_range5 a x i1)) ))))

;; in_range_last__post_axiom
  (assert true)

;; in_range_last__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((x Int))
  (! (= (= (in_range_last a x) true) (<= x (length1 a))) :pattern ((in_range_last
                                                                   a x)) ))))

(declare-sort element_out1 0)

(declare-fun element_outqtint1 (element_out1) Int)

;; element_out'axiom
  (assert
  (forall ((i1 element_out1))
  (and (<= 0 (element_outqtint1 i1)) (<= (element_outqtint1 i1) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq9 (element_out1 element_out1) Bool)

(declare-const dummy9 element_out1)

(declare-datatypes ((element_out__ref1 0))
(((element_out__refqtmk1 (element_out__content1 element_out1)))))
(define-fun element_out__ref_element_out__content__projection ((a element_out__ref1)) element_out1 
  (element_out__content1 a))

(define-fun dynamic_invariant8 ((temp___expr_268 Int)
  (temp___is_init_264 Bool) (temp___skip_constant_265 Bool)
  (temp___do_toplevel_266 Bool)
  (temp___do_typ_inv_267 Bool)) Bool (=>
                                     (or (= temp___is_init_264 true)
                                     (<= 0 2147483647)) (in_range8
                                     temp___expr_268)))

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
     (in_range5 (of_array (to_array a3) (first1 a3) (last1 a3)) init1
     (first1 a3)) (of_array (to_array a3) (first1 a3) (last1 a3)) init1
     (first1 a3)))
     (=>
     (and
     (and (dynamic_invariant9 a true true true true) (dynamic_invariant8 init
     true true true true))
     (or (= (length1 a) 0)
     (= (in_range5 (of_array (to_array a) (first1 a) (last1 a)) init
        (first1 a)) true)))
     (let ((result (fold1 a init)))
     (and
     (forall ((a3 us_t) (init1 Int)) (fold__function_guard
     (fold (of_array (to_array a3) (first1 a3) (last1 a3)) init1)
     (of_array (to_array a3) (first1 a3) (last1 a3)) init1))
     (=> (fold__function_guard1 result a init)
     (and
     (= result (ite (= (length1 a) 0) init
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
                                     (<= 1 100)) (in_range3 temp___expr_275)))

;; c__def_axiom
  (assert
  (and (choose__function_guard (choose (to_rep (select (to_array a1) i)))
  (to_rep (select (to_array a1) i)))
  (and (choose__function_guard (choose (to_rep (select (to_array a2) i)))
  (to_rep (select (to_array a2) i)))
  (and (choose__function_guard (choose (to_rep (select (to_array a1) i)))
  (to_rep (select (to_array a1) i)))
  (and (choose__function_guard (choose (to_rep (select (to_array a2) i)))
  (to_rep (select (to_array a2) i)))
  (and (choose__function_guard (choose (to_rep (select (to_array a1) i)))
  (to_rep (select (to_array a1) i)))
  (= c (ite (or
            (and (= (choose (to_rep (select (to_array a1) i))) true)
            (= (choose (to_rep (select (to_array a2) i))) true))
            (and (not (= (choose (to_rep (select (to_array a1) i))) true))
            (not (= (choose (to_rep (select (to_array a2) i))) true))))
       0 (ite (= (choose (to_rep (select (to_array a1) i))) true) 1 (- 1))))))))))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 403, characters 0-0
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
  (=> (choose__function_guard (choose (to_rep (select (to_array a1) i)))
  (to_rep (select (to_array a1) i)))
  (=> (choose__function_guard (choose (to_rep (select (to_array a2) i)))
  (to_rep (select (to_array a2) i)))
  (=> (choose__function_guard (choose (to_rep (select (to_array a1) i)))
  (to_rep (select (to_array a1) i)))
  (=> (choose__function_guard (choose (to_rep (select (to_array a2) i)))
  (to_rep (select (to_array a2) i)))
  (=> (choose__function_guard (choose (to_rep (select (to_array a1) i)))
  (to_rep (select (to_array a1) i)))
  (=> (choose__function_guard (choose (to_rep (select (to_array a2) i)))
  (to_rep (select (to_array a2) i)))
  (forall ((test_higher_order3__my_count__update_count__c__assume Int))
  (=>
  (and (and (<= (first1 a2) i) (<= i (last1 a2)))
  (exists ((o Int))
  (and (= (to_rep (select (to_array a2) i)) o)
  (let ((o1 (choose o)))
  (and (choose__function_guard o1 o)
  (and (and (<= (first1 a1) i) (<= i (last1 a1)))
  (exists ((o2 Int))
  (and (= (to_rep (select (to_array a1) i)) o2)
  (let ((o3 (choose o2)))
  (and (choose__function_guard o3 o2)
  (and (and (<= (first1 a2) i) (<= i (last1 a2)))
  (exists ((o4 Int))
  (and (= (to_rep (select (to_array a2) i)) o4)
  (let ((o5 (choose o4)))
  (and (choose__function_guard o5 o4)
  (and (and (<= (first1 a1) i) (<= i (last1 a1)))
  (exists ((o6 Int))
  (and (= (to_rep (select (to_array a1) i)) o6)
  (let ((o7 (choose o6)))
  (and (choose__function_guard o7 o6)
  (ite (= (or (and o7 o5) (and (ite (= o3 true) false true) (ite (= o1 true)
                                                            false true))) true)
  (= test_higher_order3__my_count__update_count__c__assume 0)
  (and (and (<= (first1 a1) i) (<= i (last1 a1)))
  (exists ((o8 Int))
  (and (= (to_rep (select (to_array a1) i)) o8)
  (let ((o9 (choose o8)))
  (and (choose__function_guard o9 o8)
  (ite (= o9 true)
  (= test_higher_order3__my_count__update_count__c__assume 1)
  (= test_higher_order3__my_count__update_count__c__assume (- 1)))))))))))))))))))))))))))))
  (=> (= test_higher_order3__my_count__update_count__c__assume c)
  (=> (dynamic_invariant c true false true true)
  (let ((temp___1248 (first1 a1)))
  (forall ((k Int))
  (=> (= k temp___1248)
  (=>
  (= (and (ite (<= temp___1248 k) true false) (ite (<= k (last1 a1)) true
                                              false)) true)
  (=> (not (< k i))
  (=> (dynamic_property 1 100 (first1 a2) (last1 a2))
  (let ((o (of_array (to_array a2) (first1 a2) (last1 a2))))
  (=>
  (forall ((o1 us_t)) (in_range__function_guard
  (in_range5 (of_array (to_array o1) (first1 o1) (last1 o1)) 0 (first1 o1))
  (of_array (to_array o1) (first1 o1) (last1 o1)) 0 (first1 o1)))
  (= (in_range5 (of_array (to_array o) (first1 o) (last1 o)) 0 (first1 o)) true)))))))))))))))))))))))))))))
(check-sat)
(exit)

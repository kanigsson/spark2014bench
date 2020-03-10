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

(define-fun dynamic_invariant1 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= first last)) (dynamic_property 
                                     first last temp___expr_179)))

;; first__def_axiom
  (assert (= first fst))

;; last__def_axiom
  (assert (= last lst))

(define-fun dynamic_invariant2 ((temp___expr_186 us_t)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (not (= temp___skip_constant_183 true))
                                     (dynamic_property1 first last
                                     (first2 temp___expr_186)
                                     (last2 temp___expr_186))))

;; ind_prop__post_axiom
  (assert true)

(declare-fun f (Int Int Int) Int)

(declare-fun f__function_guard (Int Int Int Int) Bool)

;; f__post_axiom
  (assert
  (forall ((x Int) (k Int) (i Int))
  (! (=>
     (and
     (and (dynamic_invariant x true true true true) (dynamic_invariant1 k
     true true true true)) (dynamic_invariant i true true true true))
     (let ((result (f x k i)))
     (=> (f__function_guard result x k i) (dynamic_invariant result true
     false true true)))) :pattern ((f x k i)) )))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__5__projection ((a array_type__ref)) us_t 
  (array_type__content a))

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
(define-fun index_type__ref_index_type__content__5__projection ((a index_type__ref)) integer 
  (index_type__content a))

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
(define-fun element_out__ref_element_out__content__5__projection ((a element_out__ref)) element_out 
  (element_out__content a))

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
  (forall ((a (Array Int element_out)))
  (forall ((first4 Int))
  (! (= (slide1 a first4 first4) a) :pattern ((slide1 a first4 first4)) ))))

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
                           (forall ((temp___idx_172 Int))
                           (=>
                           (and (<= a__first temp___idx_172)
                           (<= temp___idx_172 a__last))
                           (= (to_rep1 (select a temp___idx_172)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_172)))))))
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
  (forall ((temp___idx_172 Int))
  (=> (and (<= a__first temp___idx_172) (<= temp___idx_172 a__last))
  (= (to_rep1 (select a temp___idx_172)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_172)))))))))))

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
(define-fun to_array1 ((a us_t1)) (Array Int element_out) (elts1 a))

(define-fun of_array1 ((a (Array Int element_out)) (f1 Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f1 l)))

(define-fun first5 ((a us_t1)) Int (to_rep (first4 (rt1 a))))

(define-fun last5 ((a us_t1)) Int (to_rep (last4 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first5 a) (last5 a))
                                    (+ (- (last5 a) (first5 a)) 1) 0))

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
(define-fun acc_array__ref_acc_array__content__2__projection ((a acc_array__ref)) us_t1 
  (acc_array__content a))

(declare-fun fold (us_t Int) us_t1)

(declare-fun fold__function_guard (us_t1 us_t Int) Bool)

(declare-fun final_prop (us_t Int) Bool)

(declare-fun final_prop__function_guard (Bool us_t Int) Bool)

(define-fun dynamic_invariant3 ((temp___expr_516 Int)
  (temp___is_init_512 Bool) (temp___skip_constant_513 Bool)
  (temp___do_toplevel_514 Bool)
  (temp___do_typ_inv_515 Bool)) Bool (=>
                                     (or (= temp___is_init_512 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_516)))

(define-fun dynamic_invariant4 ((temp___expr_531 us_t1)
  (temp___is_init_527 Bool) (temp___skip_constant_528 Bool)
  (temp___do_toplevel_529 Bool)
  (temp___do_typ_inv_530 Bool)) Bool (=>
                                     (not (= temp___skip_constant_528 true))
                                     (dynamic_property3 first3 last3
                                     (first5 temp___expr_531)
                                     (last5 temp___expr_531))))

(define-fun dynamic_invariant5 ((temp___expr_510 us_t)
  (temp___is_init_506 Bool) (temp___skip_constant_507 Bool)
  (temp___do_toplevel_508 Bool)
  (temp___do_typ_inv_509 Bool)) Bool (=>
                                     (not (= temp___skip_constant_507 true))
                                     (dynamic_property1 first last
                                     (first2 temp___expr_510)
                                     (last2 temp___expr_510))))

;; fold__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((init Int))
  (! (and
     (forall ((a1 us_t) (init1 Int)) (ind_prop__function_guard
     (ind_prop (of_array (to_array a1) (first2 a1) (last2 a1)) init1
     (first2 a1)) (of_array (to_array a1) (first2 a1) (last2 a1)) init1
     (first2 a1)))
     (=>
     (and
     (and (dynamic_invariant5 a true true true true) (dynamic_invariant3 init
     true true true true))
     (and (< 0 (length a))
     (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init
        (first2 a)) true)))
     (let ((result (fold a init)))
     (and
     (forall ((a1 us_t) (init1 Int)) (ind_prop__function_guard
     (ind_prop (of_array (to_array a1) (first2 a1) (last2 a1)) init1
     (first2 a1)) (of_array (to_array a1) (first2 a1) (last2 a1)) init1
     (first2 a1)))
     (and
     (forall ((a1 us_t) (init1 Int)) (f__function_guard
     (f (to_rep (select (to_array a1) (first2 a1))) (first2 a1) init1)
     (to_rep (select (to_array a1) (first2 a1))) (first2 a1) init1))
     (and
     (forall ((a1 us_t) (result1 us_t1) (i Int)) (ind_prop__function_guard
     (ind_prop (of_array (to_array a1) (first2 a1) (last2 a1))
     (to_rep1 (select (to_array1 result1) (- i 1))) i)
     (of_array (to_array a1) (first2 a1) (last2 a1))
     (to_rep1 (select (to_array1 result1) (- i 1))) i))
     (and
     (forall ((a1 us_t) (result1 us_t1) (i Int)) (f__function_guard
     (f (to_rep (select (to_array a1) i)) i
     (to_rep1 (select (to_array1 result1) (- i 1))))
     (to_rep (select (to_array a1) i)) i
     (to_rep1 (select (to_array1 result1) (- i 1)))))
     (and
     (forall ((a1 us_t) (result1 us_t1)) (final_prop__function_guard
     (final_prop (of_array (to_array a1) (first2 a1) (last2 a1))
     (to_rep1 (select (to_array1 result1) (last2 a1))))
     (of_array (to_array a1) (first2 a1) (last2 a1))
     (to_rep1 (select (to_array1 result1) (last2 a1)))))
     (=> (fold__function_guard result a init)
     (and
     (and
     (and
     (and
     (and (and (= (first5 result) (first2 a)) (= (last5 result) (last2 a)))
     (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init
        (first2 a)) true))
     (= (to_rep1 (select (to_array1 result) (first2 a))) (f
                                                         (to_rep
                                                         (select (to_array a) 
                                                         (first2 a)))
                                                         (first2 a) init)))
     (forall ((i Int))
     (=> (and (<= (first2 a) i) (<= i (last2 a)))
     (=> (< (first2 a) i)
     (and
     (= (ind_prop (of_array (to_array a) (first2 a) (last2 a))
        (to_rep1 (select (to_array1 result) (- i 1))) i) true)
     (= (to_rep1 (select (to_array1 result) i)) (f
                                                (to_rep
                                                (select (to_array a) i)) i
                                                (to_rep1
                                                (select (to_array1 result) (- i 1))))))))))
     (= (final_prop (of_array (to_array a) (first2 a) (last2 a))
        (to_rep1 (select (to_array1 result) (last2 a)))) true))
     (dynamic_invariant4 result true false true true))))))))))) :pattern (
  (fold a init)) ))))

(declare-datatypes ((array_type__ref1 0))
(((array_type__refqtmk1 (array_type__content1 us_t)))))
(define-fun array_type__ref_array_type__content__4__projection ((a array_type__ref1)) us_t 
  (array_type__content1 a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const init Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort element_out1 0)

(declare-fun element_outqtint1 (element_out1) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out1))
  (and (<= (- 2147483648) (element_outqtint1 i))
  (<= (element_outqtint1 i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (element_out1 element_out1) Bool)

(declare-const dummy6 element_out1)

(declare-datatypes ((element_out__ref1 0))
(((element_out__refqtmk1 (element_out__content1 element_out1)))))
(define-fun element_out__ref_element_out__content__4__projection ((a1 element_out__ref1)) element_out1 
  (element_out__content1 a1))

(define-fun dynamic_invariant6 ((temp___expr_489 Int)
  (temp___is_init_485 Bool) (temp___skip_constant_486 Bool)
  (temp___do_toplevel_487 Bool)
  (temp___do_typ_inv_488 Bool)) Bool (=>
                                     (or (= temp___is_init_485 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_489)))

(define-fun dynamic_property4 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (integer integer) Bool)

(declare-const dummy7 integer)

(declare-datatypes ((t72s__ref 0))
(((t72s__refqtmk (t72s__content integer)))))
(define-fun t72s__ref_t72s__content__projection ((a1 t72s__ref)) integer 
  (t72s__content a1))

(define-fun dynamic_invariant7 ((temp___expr_483 us_t)
  (temp___is_init_479 Bool) (temp___skip_constant_480 Bool)
  (temp___do_toplevel_481 Bool)
  (temp___do_typ_inv_482 Bool)) Bool (=>
                                     (not (= temp___skip_constant_480 true))
                                     (dynamic_property1 first last
                                     (first2 temp___expr_483)
                                     (last2 temp___expr_483))))

;; final_prop__post_axiom
  (assert true)

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

(define-fun dynamic_invariant8 ((temp___expr_496 Int)
  (temp___is_init_492 Bool) (temp___skip_constant_493 Bool)
  (temp___do_toplevel_494 Bool)
  (temp___do_typ_inv_495 Bool)) Bool (=>
                                     (or (= temp___is_init_492 true)
                                     (<= first3 last3)) (dynamic_property2
                                     first3 last3 temp___expr_496)))

;; first__def_axiom
  (assert (= first3 fst))

;; last__def_axiom
  (assert (= last3 lst))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 209, characters 0-0
  (not
  (forall ((r Int))
  (=> (dynamic_invariant7 a true false true true)
  (=> (dynamic_invariant6 init true false true true)
  (=> (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init (first2 a))
  (of_array (to_array a) (first2 a) (last2 a)) init (first2 a))
  (=>
  (or (= (length a) 0)
  (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) init (first2 a)) true))
  (=> (= r init)
  (=> (dynamic_invariant6 r true false true true)
  (let ((temp___802 (first2 a)))
  (let ((temp___803 (last2 a)))
  (forall ((i Int))
  (=> (= i temp___802)
  (=>
  (= (and (ite (<= temp___802 i) true false) (ite (<= i temp___803) true
                                             false)) true)
  (=>
  (forall ((o Int) (o1 us_t)) (ind_prop__function_guard
  (ind_prop (of_array (to_array o1) (first2 o1) (last2 o1)) o (first2 o1))
  (of_array (to_array o1) (first2 o1) (last2 o1)) o (first2 o1)))
  (=>
  (forall ((o Int) (o1 us_t)) (f__function_guard
  (f (to_rep (select (to_array o1) (first2 o1))) (first2 o1) o)
  (to_rep (select (to_array o1) (first2 o1))) (first2 o1) o))
  (=>
  (forall ((o us_t) (temp___807 us_t1) (i1 Int)) (ind_prop__function_guard
  (ind_prop (of_array (to_array o) (first2 o) (last2 o))
  (to_rep1 (select (to_array1 temp___807) (- i1 1))) i1)
  (of_array (to_array o) (first2 o) (last2 o))
  (to_rep1 (select (to_array1 temp___807) (- i1 1))) i1))
  (=>
  (forall ((o us_t) (temp___807 us_t1) (i1 Int)) (f__function_guard
  (f (to_rep (select (to_array o) i1)) i1
  (to_rep1 (select (to_array1 temp___807) (- i1 1))))
  (to_rep (select (to_array o) i1)) i1
  (to_rep1 (select (to_array1 temp___807) (- i1 1)))))
  (=>
  (forall ((o us_t) (temp___807 us_t1)) (final_prop__function_guard
  (final_prop (of_array (to_array o) (first2 o) (last2 o))
  (to_rep1 (select (to_array1 temp___807) (last2 o))))
  (of_array (to_array o) (first2 o) (last2 o))
  (to_rep1 (select (to_array1 temp___807) (last2 o)))))
  (=>
  (and (dynamic_property first last i)
  (let ((o (of_array (to_array a) (first2 a) (last2 a))))
  (let ((o1 (ind_prop o r i)))
  (and (ind_prop__function_guard o1 o r i)
  (or (not (= o1 true))
  (let ((o2 init))
  (and (dynamic_property1 first last (first2 a) (last2 a))
  (let ((o3 (of_array (to_array a) (first2 a) (last2 a))))
  (let ((temp___807 (fold o3 o2)))
  (and
  (and (fold__function_guard temp___807 o3 o2)
  (and (dynamic_invariant4 temp___807 true false true true)
  (and
  (and
  (and
  (and
  (and (= (first5 temp___807) (first2 o3)) (= (last5 temp___807) (last2 o3)))
  (= (ind_prop (of_array (to_array o3) (first2 o3) (last2 o3)) o2
     (first2 o3)) true))
  (= (to_rep1 (select (to_array1 temp___807) (first2 o3))) (f
                                                           (to_rep
                                                           (select (to_array
                                                                   o3) 
                                                           (first2 o3)))
                                                           (first2 o3) o2)))
  (forall ((i1 Int))
  (=> (and (<= (first2 o3) i1) (<= i1 (last2 o3)))
  (=> (< (first2 o3) i1)
  (and
  (= (ind_prop (of_array (to_array o3) (first2 o3) (last2 o3))
     (to_rep1 (select (to_array1 temp___807) (- i1 1))) i1) true)
  (= (to_rep1 (select (to_array1 temp___807) i1)) (f
                                                  (to_rep
                                                  (select (to_array o3) i1))
                                                  i1
                                                  (to_rep1
                                                  (select (to_array1
                                                          temp___807) (- i1 1))))))))))
  (= (final_prop (of_array (to_array o3) (first2 o3) (last2 o3))
     (to_rep1 (select (to_array1 temp___807) (last2 o3)))) true))))
  (and (and (<= (first5 temp___807) i) (<= i (last5 temp___807)))
  (and (exists ((o4 Int)) (= (to_rep1 (select (to_array1 temp___807) i)) o4))
  (and (dynamic_property first last i)
  (and (and (<= (first2 a) i) (<= i (last2 a)))
  (exists ((o4 Int))
  (and (= (to_rep (select (to_array a) i)) o4)
  (let ((o5 (f o4 i r)))
  (and (f__function_guard o5 o4 i r) (dynamic_invariant o5 true false true
  true)))))))))))))))))))
  (forall ((r1 Int) (i1 Int))
  (=>
  (forall ((r2 Int) (i2 Int)) (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) r2 i2)
  (of_array (to_array a) (first2 a) (last2 a)) r2 i2))
  (=>
  (forall ((r2 Int) (i2 Int)) (f__function_guard
  (f (to_rep (select (to_array a) i2)) i2 r2)
  (to_rep (select (to_array a) i2)) i2 r2))
  (=> (fold__function_guard
  (fold (of_array (to_array a) (first2 a) (last2 a)) init)
  (of_array (to_array a) (first2 a) (last2 a)) init)
  (=>
  (and (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) r1 i1) true)
  (= (f (to_rep (select (to_array a) i1)) i1 r1) (to_rep1
                                                 (select (to_array1
                                                         (fold
                                                         (of_array
                                                         (to_array a)
                                                         (first2 a)
                                                         (last2 a)) init)) i1))))
  (=>
  (= (and (ite (and (dynamic_invariant6 r1 true true true true)
               (dynamic_property4 (first2 a) (last2 a) i1))
          true false) (ite (and (<= (first2 a) i1) (<= i1 (last2 a))) true
                      false)) true)
  (=>
  (forall ((r2 Int) (i2 Int) (o us_t)) (f__function_guard
  (f (to_rep (select (to_array o) i2)) i2 r2)
  (to_rep (select (to_array o) i2)) i2 r2))
  (=>
  (forall ((r2 Int) (i2 Int) (o us_t)) (f__function_guard
  (f (to_rep (select (to_array o) i2)) i2 r2)
  (to_rep (select (to_array o) i2)) i2 r2))
  (=>
  (forall ((r2 Int) (i2 Int) (o us_t)) (ind_prop__function_guard
  (ind_prop (of_array (to_array o) (first2 o) (last2 o))
  (f (to_rep (select (to_array o) i2)) i2 r2) (+ i2 1))
  (of_array (to_array o) (first2 o) (last2 o))
  (f (to_rep (select (to_array o) i2)) i2 r2) (+ i2 1)))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= i1 (last2 a)) false true))
  (or (not (= spark__branch true))
  (and (dynamic_property2 first3 last3 i1)
  (and (dynamic_property1 first last (first2 a) (last2 a))
  (let ((o (of_array (to_array a) (first2 a) (last2 a))))
  (= (ind_prop (of_array (to_array o) (first2 o) (last2 o))
     (f (to_rep (select (to_array o) i1)) i1 r1) (+ i1 1)) true)))))))
  (=> (dynamic_property first last i1)
  (forall ((o Int))
  (=> (= (to_rep (select (to_array a) i1)) o)
  (let ((o1 (f o i1 r1)))
  (=>
  (and (f__function_guard o1 o i1 r1) (dynamic_invariant o1 true false true
  true))
  (forall ((r2 Int))
  (=> (= r2 o1)
  (=> (not (= i1 temp___803))
  (forall ((i2 Int))
  (=> (= i2 (+ i1 1))
  (=> (dynamic_property first last i2)
  (let ((o2 (of_array (to_array a) (first2 a) (last2 a))))
  (let ((o3 (ind_prop o2 r2 i2)))
  (=> (ind_prop__function_guard o3 o2 r2 i2)
  (=> (= o3 true)
  (=> (dynamic_property1 first last (first2 a) (last2 a))
  (let ((o4 (of_array (to_array a) (first2 a) (last2 a))))
  (=>
  (forall ((o5 Int) (o6 us_t)) (ind_prop__function_guard
  (ind_prop (of_array (to_array o6) (first2 o6) (last2 o6)) o5 (first2 o6))
  (of_array (to_array o6) (first2 o6) (last2 o6)) o5 (first2 o6)))
  (= (ind_prop (of_array (to_array o4) (first2 o4) (last2 o4)) init
     (first2 o4)) true)))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)

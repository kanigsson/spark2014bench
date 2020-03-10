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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__use_formal_vectors__element_type__is_null_pointer Bool)(rec__use_formal_vectors__element_type__pointer_address Int)(rec__use_formal_vectors__element_type__pointer_value integer)))))
(define-fun us_rep_rec__use_formal_vectors__element_type__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__use_formal_vectors__element_type__is_null_pointer a))

(define-fun us_rep_rec__use_formal_vectors__element_type__pointer_address__projection ((a us_rep)) Int 
  (rec__use_formal_vectors__element_type__pointer_address a))

(define-fun us_rep_rec__use_formal_vectors__element_type__pointer_value__projection ((a us_rep)) integer 
  (rec__use_formal_vectors__element_type__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__use_formal_vectors__element_type__is_null_pointer
                           a) (rec__use_formal_vectors__element_type__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__use_formal_vectors__element_type__is_null_pointer
                           a) true))
                        (and
                        (= (rec__use_formal_vectors__element_type__pointer_address
                           a) (rec__use_formal_vectors__element_type__pointer_address
                              b))
                        (= (rec__use_formal_vectors__element_type__pointer_value
                           a) (rec__use_formal_vectors__element_type__pointer_value
                              b)))))
                   true false))

(define-fun rec__use_formal_vectors__element_type__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__use_formal_vectors__element_type__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__use_formal_vectors__element_type__is_null_pointer us_null_pointer) true))

(declare-const dummy3 us_rep)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content us_rep)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref)) us_rep 
  (element_type__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__use_formal_vectors__my_vect__element_access__is_null_pointer Bool)(rec__use_formal_vectors__my_vect__element_access__pointer_address Int)(rec__use_formal_vectors__my_vect__element_access__pointer_value us_rep)))))
(define-fun us_rep_rec__use_formal_vectors__my_vect__element_access__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__use_formal_vectors__my_vect__element_access__is_null_pointer a))

(define-fun us_rep_rec__use_formal_vectors__my_vect__element_access__pointer_address__projection ((a us_rep1)) Int 
  (rec__use_formal_vectors__my_vect__element_access__pointer_address a))

(define-fun us_rep_rec__use_formal_vectors__my_vect__element_access__pointer_value__projection ((a us_rep1)) us_rep 
  (rec__use_formal_vectors__my_vect__element_access__pointer_value a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep1)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep1 
  (us_rep__content1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                            a) (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                            a) true))
                         (and
                         (= (rec__use_formal_vectors__my_vect__element_access__pointer_address
                            a) (rec__use_formal_vectors__my_vect__element_access__pointer_address
                               b))
                         (= (rec__use_formal_vectors__my_vect__element_access__pointer_value
                            a) (rec__use_formal_vectors__my_vect__element_access__pointer_value
                               b)))))
                    true false))

(define-fun rec__use_formal_vectors__my_vect__element_access__pointer_value__pred ((a us_rep1)) Bool 
  (not
  (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
     us_null_pointer1) true))

(declare-const dummy4 us_rep1)

(declare-datatypes ((element_access__ref 0))
(((element_access__refqtmk (element_access__content us_rep1)))))
(define-fun element_access__ref_element_access__content__projection ((a element_access__ref)) us_rep1 
  (element_access__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep1))))))
(declare-fun slide ((Array Int us_rep1) Int Int) (Array Int us_rep1))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int us_rep1)) (a__first Int) (a__last Int)
  (b (Array Int us_rep1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (bool_eq1 (select a temp___idx_156)
                              (select b (+ (- b__first a__first) temp___idx_156))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep1)) (b (Array Int us_rep1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (bool_eq1 (select a temp___idx_156)
     (select b (+ (- b__first a__first) temp___idx_156))) true))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

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
(((us_tqtmk (elts (Array Int us_rep1))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep1) (elts a))

(define-fun of_array ((a (Array Int us_rep1)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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

(define-fun bool_eq3 ((x us_t)
  (y us_t)) Bool (bool_eq2 (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ((element_array__ref 0))
(((element_array__refqtmk (element_array__content us_t)))))
(define-fun element_array__ref_element_array__content__projection ((a element_array__ref)) us_t 
  (element_array__content a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer Bool)(rec__use_formal_vectors__my_vect__element_array_access__pointer_address Int)(rec__use_formal_vectors__my_vect__element_array_access__pointer_value us_t)))))
(define-fun us_rep_rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer a))

(define-fun us_rep_rec__use_formal_vectors__my_vect__element_array_access__pointer_address__projection ((a us_rep2)) Int 
  (rec__use_formal_vectors__my_vect__element_array_access__pointer_address a))

(define-fun us_rep_rec__use_formal_vectors__my_vect__element_array_access__pointer_value__projection ((a us_rep2)) us_t 
  (rec__use_formal_vectors__my_vect__element_array_access__pointer_value a))

(declare-datatypes ((us_rep__ref2 0))
(((us_rep__refqtmk2 (us_rep__content2 us_rep2)))))
(define-fun us_rep__ref___rep__content__3__projection ((a us_rep__ref2)) us_rep2 
  (us_rep__content2 a))

(define-fun bool_eq4 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
                            a) (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
                            a) true))
                         (and
                         (= (rec__use_formal_vectors__my_vect__element_array_access__pointer_address
                            a) (rec__use_formal_vectors__my_vect__element_array_access__pointer_address
                               b))
                         (= (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                            a) (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                               b)))))
                    true false))

(define-fun rec__use_formal_vectors__my_vect__element_array_access__pointer_value__pred ((a us_rep2)) Bool 
  (not
  (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
     a) true)))

(declare-const us_null_pointer2 us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
     us_null_pointer2) true))

(declare-const dummy6 us_rep2)

(declare-datatypes ((element_array_access__ref 0))
(((element_array_access__refqtmk (element_array_access__content us_rep2)))))
(define-fun element_array_access__ref_element_array_access__content__projection ((a element_array_access__ref)) us_rep2 
  (element_array_access__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__use_formal_vectors__my_vect__vector__top natural)(rec__use_formal_vectors__my_vect__vector__content us_rep2)))))
(define-fun us_split_fields_rec__use_formal_vectors__my_vect__vector__top__projection ((a us_split_fields)) natural 
  (rec__use_formal_vectors__my_vect__vector__top a))

(define-fun us_split_fields_rec__use_formal_vectors__my_vect__vector__content__projection ((a us_split_fields)) us_rep2 
  (rec__use_formal_vectors__my_vect__vector__content a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep3)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq5 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (to_rep
                            (rec__use_formal_vectors__my_vect__vector__top
                            (us_split_fields1 a))) (to_rep
                                                   (rec__use_formal_vectors__my_vect__vector__top
                                                   (us_split_fields1 b))))
                         (= (bool_eq4
                            (rec__use_formal_vectors__my_vect__vector__content
                            (us_split_fields1 a))
                            (rec__use_formal_vectors__my_vect__vector__content
                            (us_split_fields1 b))) true))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const use_formal_vectors__my_vect__vector__top__first__bit Int)

(declare-const use_formal_vectors__my_vect__vector__top__last__bit Int)

(declare-const use_formal_vectors__my_vect__vector__top__position Int)

;; use_formal_vectors__my_vect__vector__top__first__bit_axiom
  (assert (<= 0 use_formal_vectors__my_vect__vector__top__first__bit))

;; use_formal_vectors__my_vect__vector__top__last__bit_axiom
  (assert
  (< use_formal_vectors__my_vect__vector__top__first__bit use_formal_vectors__my_vect__vector__top__last__bit))

;; use_formal_vectors__my_vect__vector__top__position_axiom
  (assert (<= 0 use_formal_vectors__my_vect__vector__top__position))

(declare-const use_formal_vectors__my_vect__vector__content__first__bit Int)

(declare-const use_formal_vectors__my_vect__vector__content__last__bit Int)

(declare-const use_formal_vectors__my_vect__vector__content__position Int)

;; use_formal_vectors__my_vect__vector__content__first__bit_axiom
  (assert (<= 0 use_formal_vectors__my_vect__vector__content__first__bit))

;; use_formal_vectors__my_vect__vector__content__last__bit_axiom
  (assert
  (< use_formal_vectors__my_vect__vector__content__first__bit use_formal_vectors__my_vect__vector__content__last__bit))

;; use_formal_vectors__my_vect__vector__content__position_axiom
  (assert (<= 0 use_formal_vectors__my_vect__vector__content__position))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-const dummy7 us_rep3)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep3)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep3 
  (vector__content a))

(define-fun dynamic_invariant ((temp___expr_246 us_rep3)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (and
                                     (=> (= temp___do_toplevel_244 true)
                                     (or
                                     (= (to_rep
                                        (rec__use_formal_vectors__my_vect__vector__top
                                        (us_split_fields1 temp___expr_246))) 0)
                                     (and
                                     (and
                                     (not
                                     (= (bool_eq4
                                        (rec__use_formal_vectors__my_vect__vector__content
                                        (us_split_fields1 temp___expr_246))
                                        us_null_pointer2) true))
                                     (<= (to_rep
                                         (rec__use_formal_vectors__my_vect__vector__top
                                         (us_split_fields1 temp___expr_246))) 
                                     (last1
                                     (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                     (rec__use_formal_vectors__my_vect__vector__content
                                     (us_split_fields1 temp___expr_246))))))
                                     (forall ((i Int))
                                     (=>
                                     (and (<= 1 i)
                                     (<= i (to_rep
                                           (rec__use_formal_vectors__my_vect__vector__top
                                           (us_split_fields1 temp___expr_246)))))
                                     (not
                                     (= (bool_eq1
                                        (let ((temp___248 (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                          (rec__use_formal_vectors__my_vect__vector__content
                                                          (us_split_fields1
                                                          temp___expr_246)))))
                                        (select (to_array temp___248) i))
                                        us_null_pointer1) true)))))))
                                     (=>
                                     (not
                                     (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
                                        (rec__use_formal_vectors__my_vect__vector__content
                                        (us_split_fields1 temp___expr_246))) true))
                                     (and (dynamic_property 1 2147483647
                                     (first1
                                     (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                     (rec__use_formal_vectors__my_vect__vector__content
                                     (us_split_fields1 temp___expr_246))))
                                     (last1
                                     (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                     (rec__use_formal_vectors__my_vect__vector__content
                                     (us_split_fields1 temp___expr_246)))))
                                     (forall ((temp___249 Int))
                                     (=>
                                     (and
                                     (<= (first1
                                         (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                         (rec__use_formal_vectors__my_vect__vector__content
                                         (us_split_fields1 temp___expr_246)))) temp___249)
                                     (<= temp___249 (last1
                                                    (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                    (rec__use_formal_vectors__my_vect__vector__content
                                                    (us_split_fields1
                                                    temp___expr_246))))))
                                     (=>
                                     (not
                                     (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                                        (select (to_array
                                                (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                (rec__use_formal_vectors__my_vect__vector__content
                                                (us_split_fields1
                                                temp___expr_246)))) temp___249)) true))
                                     (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        (rec__use_formal_vectors__my_vect__element_access__pointer_value
                                        (select (to_array
                                                (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                (rec__use_formal_vectors__my_vect__vector__content
                                                (us_split_fields1
                                                temp___expr_246)))) temp___249))) true)))))))))

(define-fun default_initial_assumption ((temp___expr_250 us_rep3)
  (temp___skip_top_level_251 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__use_formal_vectors__my_vect__vector__top
                                            (us_split_fields1
                                            temp___expr_250))) 0)
                                         (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
                                            (rec__use_formal_vectors__my_vect__vector__content
                                            (us_split_fields1
                                            temp___expr_250))) true)))

(define-fun dynamic_predicate ((temp___253 us_rep3)) Bool (or
                                                          (= (to_rep
                                                             (rec__use_formal_vectors__my_vect__vector__top
                                                             (us_split_fields1
                                                             temp___253))) 0)
                                                          (and
                                                          (and
                                                          (not
                                                          (= (bool_eq4
                                                             (rec__use_formal_vectors__my_vect__vector__content
                                                             (us_split_fields1
                                                             temp___253))
                                                             us_null_pointer2) true))
                                                          (<= (to_rep
                                                              (rec__use_formal_vectors__my_vect__vector__top
                                                              (us_split_fields1
                                                              temp___253))) 
                                                          (last1
                                                          (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                          (rec__use_formal_vectors__my_vect__vector__content
                                                          (us_split_fields1
                                                          temp___253))))))
                                                          (forall ((i Int))
                                                          (=>
                                                          (and (<= 1 i)
                                                          (<= i (to_rep
                                                                (rec__use_formal_vectors__my_vect__vector__top
                                                                (us_split_fields1
                                                                temp___253)))))
                                                          (not
                                                          (= (bool_eq1
                                                             (let ((temp___255 
                                                             (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                             (rec__use_formal_vectors__my_vect__vector__content
                                                             (us_split_fields1
                                                             temp___253)))))
                                                             (select 
                                                             (to_array
                                                             temp___255) i))
                                                             us_null_pointer1) true)))))))

(declare-const i72s us_rep3)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_225 us_rep1)
  (temp___is_init_221 Bool) (temp___skip_constant_222 Bool)
  (temp___do_toplevel_223 Bool)
  (temp___do_typ_inv_224 Bool)) Bool (=>
                                     (not
                                     (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                                        temp___expr_225) true))
                                     (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        (rec__use_formal_vectors__my_vect__element_access__pointer_value
                                        temp___expr_225)) true))))

(define-fun default_initial_assumption1 ((temp___expr_226 us_rep1)
  (temp___skip_top_level_227 Bool)) Bool (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                                            temp___expr_226) true))

(define-fun dynamic_invariant5 ((temp___expr_232 us_t)
  (temp___is_init_228 Bool) (temp___skip_constant_229 Bool)
  (temp___do_toplevel_230 Bool)
  (temp___do_typ_inv_231 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_229 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_232)
                                     (last1 temp___expr_232)))
                                     (forall ((temp___233 Int))
                                     (=>
                                     (and
                                     (<= (first1 temp___expr_232) temp___233)
                                     (<= temp___233 (last1 temp___expr_232)))
                                     (=>
                                     (not
                                     (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                                        (select (to_array temp___expr_232) temp___233)) true))
                                     (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        (rec__use_formal_vectors__my_vect__element_access__pointer_value
                                        (select (to_array temp___expr_232) temp___233))) true)))))))

(define-fun dynamic_invariant6 ((temp___expr_238 us_rep2)
  (temp___is_init_234 Bool) (temp___skip_constant_235 Bool)
  (temp___do_toplevel_236 Bool)
  (temp___do_typ_inv_237 Bool)) Bool (=>
                                     (not
                                     (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
                                        temp___expr_238) true))
                                     (and (dynamic_property 1 2147483647
                                     (first1
                                     (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                     temp___expr_238))
                                     (last1
                                     (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                     temp___expr_238)))
                                     (forall ((temp___239 Int))
                                     (=>
                                     (and
                                     (<= (first1
                                         (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                         temp___expr_238)) temp___239)
                                     (<= temp___239 (last1
                                                    (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                    temp___expr_238))))
                                     (=>
                                     (not
                                     (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                                        (select (to_array
                                                (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                temp___expr_238)) temp___239)) true))
                                     (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        (rec__use_formal_vectors__my_vect__element_access__pointer_value
                                        (select (to_array
                                                (rec__use_formal_vectors__my_vect__element_array_access__pointer_value
                                                temp___expr_238)) temp___239))) true))))))))

(define-fun default_initial_assumption2 ((temp___expr_240 us_rep2)
  (temp___skip_top_level_241 Bool)) Bool (= (rec__use_formal_vectors__my_vect__element_array_access__is_null_pointer
                                            temp___expr_240) true))

(define-fun dynamic_invariant7 ((temp___expr_211 us_rep)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        temp___expr_211) true)))

(define-fun default_initial_assumption3 ((temp___expr_212 us_rep)
  (temp___skip_top_level_213 Bool)) Bool (= (rec__use_formal_vectors__element_type__is_null_pointer
                                            temp___expr_212) true))

(assert
;; defqtvc
 ;; File "formal_vectors.ads", line 60, characters 0-0
  (not
  (forall ((o Int))
  (=> (dynamic_invariant i72s true false false true)
  (=>
  (= (to_rep
     (rec__use_formal_vectors__my_vect__vector__top (us_split_fields1 i72s))) o)
  (=> (not (= o 0))
  (=>
  (= (not (bool_eq4
          (rec__use_formal_vectors__my_vect__vector__content
          (us_split_fields1 i72s)) us_null_pointer2)) true)
  (rec__use_formal_vectors__my_vect__element_array_access__pointer_value__pred
  (rec__use_formal_vectors__my_vect__vector__content (us_split_fields1 i72s))))))))))
(check-sat)
(exit)

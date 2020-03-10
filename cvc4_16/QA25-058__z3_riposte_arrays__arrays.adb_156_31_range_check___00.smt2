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

(declare-sort character 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (character character) Bool)

(declare-const dummy character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-sort length_t 0)

(declare-fun length_tqtint (length_t) Int)

;; length_t'axiom
  (assert
  (forall ((i length_t))
  (and (<= 0 (length_tqtint i)) (<= (length_tqtint i) 5))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (length_t length_t) Bool)

(declare-const dummy1 length_t)

(declare-datatypes ((length_t__ref 0))
(((length_t__refqtmk (length_t__content length_t)))))
(define-fun length_t__ref_length_t__content__projection ((a length_t__ref)) length_t 
  (length_t__content a))

(define-fun to_rep1 ((x length_t)) Int (length_tqtint x))

(declare-fun of_rep1 (Int) length_t)

;; inversion_axiom
  (assert
  (forall ((x length_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x length_t)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-const dummy2 (Array Int character))

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

(declare-fun user_eq2 ((Array Int character) (Array Int character)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__arrays__string_t__len length_t)(rec__arrays__string_t__elem (Array Int character))))))
(define-fun us_split_fields_rec__arrays__string_t__len__projection ((a us_split_fields)) length_t 
  (rec__arrays__string_t__len a))

(define-fun us_split_fields_rec__arrays__string_t__elem__projection ((a us_split_fields)) (Array Int character) 
  (rec__arrays__string_t__elem a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__arrays__string_t__len (us_split_fields1 a))) 
                        (to_rep1
                        (rec__arrays__string_t__len (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__arrays__string_t__elem (us_split_fields1 a))
                           1 5
                           (rec__arrays__string_t__elem (us_split_fields1 b))
                           1 5) true))
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

(declare-const arrays__string_t__len__first__bit Int)

(declare-const arrays__string_t__len__last__bit Int)

(declare-const arrays__string_t__len__position Int)

;; arrays__string_t__len__first__bit_axiom
  (assert (<= 0 arrays__string_t__len__first__bit))

;; arrays__string_t__len__last__bit_axiom
  (assert
  (< arrays__string_t__len__first__bit arrays__string_t__len__last__bit))

;; arrays__string_t__len__position_axiom
  (assert (<= 0 arrays__string_t__len__position))

(declare-const arrays__string_t__elem__first__bit Int)

(declare-const arrays__string_t__elem__last__bit Int)

(declare-const arrays__string_t__elem__position Int)

;; arrays__string_t__elem__first__bit_axiom
  (assert (<= 0 arrays__string_t__elem__first__bit))

;; arrays__string_t__elem__last__bit_axiom
  (assert
  (< arrays__string_t__elem__first__bit arrays__string_t__elem__last__bit))

;; arrays__string_t__elem__position_axiom
  (assert (<= 0 arrays__string_t__elem__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((string_t__ref 0))
(((string_t__refqtmk (string_t__content us_rep)))))
(define-fun string_t__ref_string_t__content__projection ((a string_t__ref)) us_rep 
  (string_t__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort index_t 0)

(declare-fun index_tqtint (index_t) Int)

;; index_t'axiom
  (assert
  (forall ((i index_t))
  (and (<= 1 (index_tqtint i)) (<= (index_tqtint i) 5))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (index_t index_t) Bool)

(declare-const dummy4 index_t)

(declare-datatypes ((index_t__ref 0))
(((index_t__refqtmk (index_t__content index_t)))))
(define-fun index_t__ref_index_t__content__projection ((a index_t__ref)) index_t 
  (index_t__content a))

(define-fun dynamic_invariant ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range1 temp___expr_74)))

(define-fun dynamic_invariant1 ((temp___expr_280 Int)
  (temp___is_init_276 Bool) (temp___skip_constant_277 Bool)
  (temp___do_toplevel_278 Bool)
  (temp___do_typ_inv_279 Bool)) Bool (=>
                                     (or (= temp___is_init_276 true)
                                     (<= 0 5)) (in_range2 temp___expr_280)))

(define-fun dynamic_invariant2 ((temp___expr_287 Int)
  (temp___is_init_283 Bool) (temp___skip_constant_284 Bool)
  (temp___do_toplevel_285 Bool)
  (temp___do_typ_inv_286 Bool)) Bool (=>
                                     (or (= temp___is_init_283 true)
                                     (<= 1 5)) (in_range3 temp___expr_287)))

(assert
;; defqtvc
 ;; File "arrays.adb", line 151, characters 0-0
  (not
  (forall ((s__split_fields us_split_fields) (o Int))
  (=>
  (forall ((i Int))
  (=>
  (and (<= (+ (to_rep1 (rec__arrays__string_t__len s__split_fields)) 1) i)
  (<= i 5))
  (= (to_rep (select (rec__arrays__string_t__elem s__split_fields) i)) 32)))
  (=> (< (to_rep1 (rec__arrays__string_t__len s__split_fields)) 5)
  (=> (= (to_rep1 (rec__arrays__string_t__len s__split_fields)) o)
  (let ((o1 (+ o 1)))
  (=> (in_range2 o1)
  (forall ((o2 length_t))
  (=> (= (to_rep1 o2) o1)
  (forall ((s__split_fields1 us_split_fields))
  (=>
  (= s__split_fields1 (us_split_fieldsqtmk o2
                      (rec__arrays__string_t__elem s__split_fields)))
  (forall ((o3 character))
  (=> (= (to_rep o3) 120)
  (forall ((temp___343 Int))
  (=> (= (to_rep1 (rec__arrays__string_t__len s__split_fields1)) temp___343)
  (=> (and (<= 1 temp___343) (<= temp___343 5))
  (forall ((s__split_fields2 us_split_fields))
  (=>
  (= s__split_fields2 (us_split_fieldsqtmk
                      (rec__arrays__string_t__len s__split_fields1)
                      (store (rec__arrays__string_t__elem s__split_fields1) temp___343 o3)))
  (=> (<= (+ (to_rep1 (rec__arrays__string_t__len s__split_fields2)) 1) 5)
  (<= 1 (+ (to_rep1 (rec__arrays__string_t__len s__split_fields2)) 1))))))))))))))))))))))
(check-sat)
(exit)

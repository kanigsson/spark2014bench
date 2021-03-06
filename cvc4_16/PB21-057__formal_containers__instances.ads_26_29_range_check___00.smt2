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

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 1000))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (capacity_range capacity_range) Bool)

(declare-const dummy capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__instances__vectors__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__instances__vectors__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__instances__vectors__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__instances__vectors__vector us_main_type)))))
(define-fun us_split_fields_rec__instances__vectors__vector__projection ((a us_split_fields)) us_main_type 
  (rec__instances__vectors__vector a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__instances__vectors__vector__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__instances__vectors__vector__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__instances__vectors__vector
                           (us_split_fields1 a))
                           (rec__instances__vectors__vector
                           (us_split_fields1 b))) true))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const instances__vectors__vector__capacity__first__bit Int)

(declare-const instances__vectors__vector__capacity__last__bit Int)

(declare-const instances__vectors__vector__capacity__position Int)

;; instances__vectors__vector__capacity__first__bit_axiom
  (assert (<= 0 instances__vectors__vector__capacity__first__bit))

;; instances__vectors__vector__capacity__last__bit_axiom
  (assert
  (< instances__vectors__vector__capacity__first__bit instances__vectors__vector__capacity__last__bit))

;; instances__vectors__vector__capacity__position_axiom
  (assert (<= 0 instances__vectors__vector__capacity__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((t389s__ref 0))
(((t389s__refqtmk (t389s__content us_rep)))))
(define-fun t389s__ref_t389s__content__projection ((a t389s__ref)) us_rep 
  (t389s__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__instances__dataT__vect us_rep)))))
(define-fun us_split_fields_rec__instances__dataT__vect__projection ((a us_split_fields2)) us_rep 
  (rec__instances__dataT__vect a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__4__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const instances__dataT__vect__first__bit Int)

(declare-const instances__dataT__vect__last__bit Int)

(declare-const instances__dataT__vect__position Int)

;; instances__dataT__vect__first__bit_axiom
  (assert (<= 0 instances__dataT__vect__first__bit))

;; instances__dataT__vect__last__bit_axiom
  (assert
  (< instances__dataT__vect__first__bit instances__dataT__vect__last__bit))

;; instances__dataT__vect__position_axiom
  (assert (<= 0 instances__dataT__vect__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-datatypes ((dataT__ref 0))
(((dataT__refqtmk (dataT__content us_rep1)))))
(define-fun dataT__ref_dataT__content__projection ((a dataT__ref)) us_rep1 
  (dataT__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range1 ((rec__instances__vectors__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__instances__vectors__vector__capacity1 
  (to_rep (rec__instances__vectors__vector__capacity a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const instances__vectors__vector__capacity__first__bit1 Int)

(declare-const instances__vectors__vector__capacity__last__bit1 Int)

(declare-const instances__vectors__vector__capacity__position1 Int)

;; instances__vectors__vector__capacity__first__bit_axiom
  (assert (<= 0 instances__vectors__vector__capacity__first__bit1))

;; instances__vectors__vector__capacity__last__bit_axiom
  (assert
  (< instances__vectors__vector__capacity__first__bit1 instances__vectors__vector__capacity__last__bit1))

;; instances__vectors__vector__capacity__position_axiom
  (assert (<= 0 instances__vectors__vector__capacity__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep 
  (vector__content a))

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_819 us_rep1)
  (temp___is_init_815 Bool) (temp___skip_constant_816 Bool)
  (temp___do_toplevel_817 Bool) (temp___do_typ_inv_818 Bool)) Bool (in_range1
  10
  (us_split_discrs1
  (rec__instances__dataT__vect (us_split_fields3 temp___expr_819)))))

(define-fun default_initial_assumption ((temp___expr_821 us_rep1)
  (temp___skip_top_level_822 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__instances__vectors__vector__capacity
                                            (us_split_discrs1
                                            (rec__instances__dataT__vect
                                            (us_split_fields3
                                            temp___expr_821))))) 10)
                                         (= (is_empty
                                            (rec__instances__dataT__vect
                                            (us_split_fields3
                                            temp___expr_821))) true)))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2 (rec__instances__t us_main_type1)))))
(define-fun us_split_fields_rec__instances__t__projection ((a us_split_fields4)) us_main_type1 
  (rec__instances__t a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__5__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq4 (us_rep2 us_rep2) Bool)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep2)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep2 (t__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep2))))))
(declare-fun slide ((Array Int us_rep2) Int Int) (Array Int us_rep2))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep2)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep2)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(declare-fun bool_eq1 ((Array Int us_rep2) Int Int (Array Int us_rep2) Int
  Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tarrD1 0)

(declare-fun tarrD1qtint (tarrD1) Int)

;; tarrD1'axiom
  (assert
  (forall ((i tarrD1)) (and (<= 1 (tarrD1qtint i)) (<= (tarrD1qtint i) 3))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq5 (tarrD1 tarrD1) Bool)

(declare-const dummy3 tarrD1)

(declare-datatypes ((tarrD1__ref 0))
(((tarrD1__refqtmk (tarrD1__content tarrD1)))))
(define-fun tarrD1__ref_tarrD1__content__projection ((a tarrD1__ref)) tarrD1 
  (tarrD1__content a))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq6 (count_type count_type) Bool)

(declare-const dummy4 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_277 Int)
  (temp___is_init_273 Bool) (temp___skip_constant_274 Bool)
  (temp___do_toplevel_275 Bool)
  (temp___do_typ_inv_276 Bool)) Bool (=>
                                     (or (= temp___is_init_273 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_277)))

(define-fun dynamic_invariant2 ((temp___expr_659 Int)
  (temp___is_init_655 Bool) (temp___skip_constant_656 Bool)
  (temp___do_toplevel_657 Bool)
  (temp___do_typ_inv_658 Bool)) Bool (=>
                                     (or (= temp___is_init_655 true)
                                     (<= 0 1000)) (in_range temp___expr_659)))

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq3 a b) (oeq a b)) :pattern ((user_eq3 a b)) )))

(define-fun capacity ((container us_rep)) Int (to_rep
                                              (rec__instances__vectors__vector__capacity
                                              (us_split_discrs1 container))))

(declare-fun capacity__function_guard (Int us_rep) Bool)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= result (capacity container)) (dynamic_invariant2 result true
     false true true))) :pattern ((length container)) )))

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep3 0)

(declare-fun bool_eq2 (us_rep3 us_rep3) Bool)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-fun user_eq7 (us_rep3 us_rep3) Bool)

(declare-const dummy5 us_rep3)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep3)))))
(define-fun sequence__ref_sequence__content__2__projection ((a sequence__ref)) us_rep3 
  (sequence__content a))

(declare-fun length1 (us_rep3) Int)

(declare-fun length__function_guard1 (Int us_rep3) Bool)

(declare-fun model1 (us_rep) us_rep3)

(declare-fun model__function_guard (us_rep3 us_rep) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range4 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(define-fun last ((container us_rep3)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep3) Bool)

(declare-fun get (us_rep3 Int) Int)

(declare-fun get__function_guard (Int us_rep3 Int) Bool)

(define-fun oeq1 ((left us_rep3)
  (right us_rep3)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get left
                                                                   n) 
                                                                (get right n))))
                                                                true false)))

(declare-fun oeq__function_guard1 (Bool us_rep3 us_rep3) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep3) (b us_rep3))
  (! (= (user_eq7 a b) (oeq1 a b)) :pattern ((user_eq7 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_698 us_rep3)
  (temp___skip_top_level_699 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_699 true))
                                         (= (length1 temp___expr_698) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (= (is_empty container) true) (= (length container) 0)) :pattern (
  (is_empty container)) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 1000))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq8 (extended_index extended_index) Bool)

(declare-const dummy6 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__3__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant3 ((temp___expr_690 Int)
  (temp___is_init_686 Bool) (temp___skip_constant_687 Bool)
  (temp___do_toplevel_688 Bool)
  (temp___do_typ_inv_689 Bool)) Bool (=>
                                     (or (= temp___is_init_686 true)
                                     (<= 0 1000)) (in_range5
                                     temp___expr_690)))

;; length__post_axiom
  (assert
  (forall ((container us_rep3))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 1000) (dynamic_invariant1 result true false true
     true))) :pattern ((length1 container)) )))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq9 (element_type element_type) Bool)

(declare-const dummy7 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__5__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant4 ((temp___expr_683 Int)
  (temp___is_init_679 Bool) (temp___skip_constant_680 Bool)
  (temp___do_toplevel_681 Bool)
  (temp___do_typ_inv_682 Bool)) Bool (=>
                                     (or (= temp___is_init_679 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range6 temp___expr_683)))

;; get__post_axiom
  (assert
  (forall ((container us_rep3))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant3 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant4 (get container position) true false true true)) :pattern (
  (get container position)) ))))

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq1 a b) (oeq a b)) :pattern ((user_eq1 a b)) )))

(assert
;; defqtvc
 ;; File "instances.ads", line 8, characters 0-0
  (not (in_range 10)))
(check-sat)
(exit)

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

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (character character) Bool)

(declare-const dummy1 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep1 (character) Int)

(declare-fun of_rep1 (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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
                           (= (to_rep1 (select a temp___idx_91)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                        (select b (+ (- b__first a__first) temp___idx_91)))))))))))

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

(declare-sort state 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (state state) Bool)

(declare-const dummy3 state)

(declare-datatypes ((state__ref 0))
(((state__refqtmk (state__content state)))))
(define-fun state__ref_state__content__projection ((a state__ref)) state 
  (state__content a))

(declare-fun to_rep2 (state) Int)

(declare-fun of_rep2 (Int) state)

;; inversion_axiom
  (assert
  (forall ((x state))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x state)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__file_system__file__filename (Array Int character))(rec__file_system__file__cursor integer)(rec__file_system__file__status state)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__file_system__file__filename__projection ((a us_split_fields)) (Array Int character) 
  (rec__file_system__file__filename a))

(define-fun us_split_fields_rec__file_system__file__cursor__projection ((a us_split_fields)) integer 
  (rec__file_system__file__cursor a))

(define-fun us_split_fields_rec__file_system__file__status__projection ((a us_split_fields)) state 
  (rec__file_system__file__status a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (bool_eq
                           (rec__file_system__file__filename
                           (us_split_fields1 a)) 1 20
                           (rec__file_system__file__filename
                           (us_split_fields1 b)) 1 20) true)
                        (= (to_rep
                           (rec__file_system__file__cursor
                           (us_split_fields1 a))) (to_rep
                                                  (rec__file_system__file__cursor
                                                  (us_split_fields1 b)))))
                        (= (to_rep2
                           (rec__file_system__file__status
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__file_system__file__status
                                                  (us_split_fields1 b)))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const file_system__file__filename__first__bit Int)

(declare-const file_system__file__filename__last__bit Int)

(declare-const file_system__file__filename__position Int)

;; file_system__file__filename__first__bit_axiom
  (assert (<= 0 file_system__file__filename__first__bit))

;; file_system__file__filename__last__bit_axiom
  (assert
  (< file_system__file__filename__first__bit file_system__file__filename__last__bit))

;; file_system__file__filename__position_axiom
  (assert (<= 0 file_system__file__filename__position))

(declare-const file_system__file__cursor__first__bit Int)

(declare-const file_system__file__cursor__last__bit Int)

(declare-const file_system__file__cursor__position Int)

;; file_system__file__cursor__first__bit_axiom
  (assert (<= 0 file_system__file__cursor__first__bit))

;; file_system__file__cursor__last__bit_axiom
  (assert
  (< file_system__file__cursor__first__bit file_system__file__cursor__last__bit))

;; file_system__file__cursor__position_axiom
  (assert (<= 0 file_system__file__cursor__position))

(declare-const file_system__file__status__first__bit Int)

(declare-const file_system__file__status__last__bit Int)

(declare-const file_system__file__status__position Int)

;; file_system__file__status__first__bit_axiom
  (assert (<= 0 file_system__file__status__first__bit))

;; file_system__file__status__last__bit_axiom
  (assert
  (< file_system__file__status__first__bit file_system__file__status__last__bit))

;; file_system__file__status__position_axiom
  (assert (<= 0 file_system__file__status__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((file__ref 0))
(((file__refqtmk (file__content us_rep)))))
(define-fun file__ref_file__content__projection ((a file__ref)) us_rep 
  (file__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__synchronized_file_system__s_file__in_synch Bool)(rec__file_system__file__filename1 (Array Int character))(rec__file_system__file__cursor1 integer)(rec__file_system__file__status1 state)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__synchronized_file_system__s_file__in_synch__projection ((a us_split_fields2)) Bool 
  (rec__synchronized_file_system__s_file__in_synch a))

(define-fun us_split_fields_rec__file_system__file__filename__2__projection ((a us_split_fields2)) (Array Int character) 
  (rec__file_system__file__filename1 a))

(define-fun us_split_fields_rec__file_system__file__cursor__2__projection ((a us_split_fields2)) integer 
  (rec__file_system__file__cursor1 a))

(define-fun us_split_fields_rec__file_system__file__status__2__projection ((a us_split_fields2)) state 
  (rec__file_system__file__status1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (Bool us_private) us_private)

(declare-fun extract__synchronized_file_system__s_file__in_synch (us_private) Bool)

;; extract__synchronized_file_system__s_file__in_synch__conv
  (assert
  (forall ((synchronized_file_system__s_file__in_synch Bool))
  (forall ((rec__ext__2 us_private))
  (= (ite (extract__synchronized_file_system__s_file__in_synch
          (hide_ext__ synchronized_file_system__s_file__in_synch rec__ext__2)) 1 0) (ite synchronized_file_system__s_file__in_synch 1 0)))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__file_system__file__filename1
                                         (us_split_fields3 a))
                                         (rec__file_system__file__cursor1
                                         (us_split_fields3 a))
                                         (rec__file_system__file__status1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__synchronized_file_system__s_file__in_synch
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__synchronized_file_system__s_file__in_synch
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__file_system__file__filename
                                         (us_split_fields1 r))
                                         (rec__file_system__file__cursor
                                         (us_split_fields1 r))
                                         (rec__file_system__file__status
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (ite (rec__synchronized_file_system__s_file__in_synch
                                 (us_split_fields3 a)) 1 0) (ite (rec__synchronized_file_system__s_file__in_synch
                                                                 (us_split_fields3
                                                                 b)) 1 0))
                         (= (bool_eq
                            (rec__file_system__file__filename1
                            (us_split_fields3 a)) 1 20
                            (rec__file_system__file__filename1
                            (us_split_fields3 b)) 1 20) true))
                         (and
                         (= (to_rep
                            (rec__file_system__file__cursor1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__file_system__file__cursor1
                                                   (us_split_fields3 b))))
                         (= (to_rep2
                            (rec__file_system__file__status1
                            (us_split_fields3 a))) (to_rep2
                                                   (rec__file_system__file__status1
                                                   (us_split_fields3 b))))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const synchronized_file_system__s_file__in_synch__first__bit Int)

(declare-const synchronized_file_system__s_file__in_synch__last__bit Int)

(declare-const synchronized_file_system__s_file__in_synch__position Int)

;; synchronized_file_system__s_file__in_synch__first__bit_axiom
  (assert (<= 0 synchronized_file_system__s_file__in_synch__first__bit))

;; synchronized_file_system__s_file__in_synch__last__bit_axiom
  (assert
  (< synchronized_file_system__s_file__in_synch__first__bit synchronized_file_system__s_file__in_synch__last__bit))

;; synchronized_file_system__s_file__in_synch__position_axiom
  (assert (<= 0 synchronized_file_system__s_file__in_synch__position))

(declare-const file_system__file__filename__first__bit1 Int)

(declare-const file_system__file__filename__last__bit1 Int)

(declare-const file_system__file__filename__position1 Int)

;; file_system__file__filename__first__bit_axiom
  (assert (<= 0 file_system__file__filename__first__bit1))

;; file_system__file__filename__last__bit_axiom
  (assert
  (< file_system__file__filename__first__bit1 file_system__file__filename__last__bit1))

;; file_system__file__filename__position_axiom
  (assert (<= 0 file_system__file__filename__position1))

(declare-const file_system__file__cursor__first__bit1 Int)

(declare-const file_system__file__cursor__last__bit1 Int)

(declare-const file_system__file__cursor__position1 Int)

;; file_system__file__cursor__first__bit_axiom
  (assert (<= 0 file_system__file__cursor__first__bit1))

;; file_system__file__cursor__last__bit_axiom
  (assert
  (< file_system__file__cursor__first__bit1 file_system__file__cursor__last__bit1))

;; file_system__file__cursor__position_axiom
  (assert (<= 0 file_system__file__cursor__position1))

(declare-const file_system__file__status__first__bit1 Int)

(declare-const file_system__file__status__last__bit1 Int)

(declare-const file_system__file__status__position1 Int)

;; file_system__file__status__first__bit_axiom
  (assert (<= 0 file_system__file__status__first__bit1))

;; file_system__file__status__last__bit_axiom
  (assert
  (< file_system__file__status__first__bit1 file_system__file__status__last__bit1))

;; file_system__file__status__position_axiom
  (assert (<= 0 file_system__file__status__position1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((s_file__ref 0))
(((s_file__refqtmk (s_file__content us_rep1)))))
(define-fun s_file__ref_s_file__content__projection ((a s_file__ref)) us_rep1 
  (s_file__content a))

(declare-const f__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun closed (us_rep) Bool)

(declare-fun closed__function_guard (Bool us_rep) Bool)

(declare-fun closed1 (Int us_rep) Bool)

(declare-fun closed__function_guard1 (Bool Int us_rep) Bool)

;; temp___result_188'def
  (assert
  (forall ((temp___187 us_rep1)) (closed__function_guard
  (closed (to_base temp___187)) (to_base temp___187))))

(define-fun dynamic_invariant ((temp___expr_186 us_rep1)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=> (= temp___do_toplevel_184 true)
                                     (=> (= temp___is_init_182 true)
                                     (or
                                     (= (closed (to_base temp___expr_186)) true)
                                     (= (rec__synchronized_file_system__s_file__in_synch
                                        (us_split_fields3 temp___expr_186)) true)))))

(define-fun default_initial_assumption ((temp___expr_190 us_rep1)
  (temp___skip_top_level_191 Bool)) Bool (= (attr__tag1 temp___expr_190) 
  us_tag1))

;; temp___result_200'def
  (assert
  (forall ((temp___199 us_rep1)) (closed__function_guard
  (closed (to_base temp___199)) (to_base temp___199))))

(define-fun dynamic_predicate ((temp___198 us_rep1)) Bool (or
                                                          (= (closed
                                                             (to_base
                                                             temp___198)) true)
                                                          (= (rec__synchronized_file_system__s_file__in_synch
                                                             (us_split_fields3
                                                             temp___198)) true)))

(declare-fun closed2 (us_rep1) Bool)

(declare-fun closed__function_guard2 (Bool us_rep1) Bool)

(declare-fun closed3 (Int us_rep1) Bool)

(declare-fun closed__function_guard3 (Bool Int us_rep1) Bool)

;; closed__post_axiom
  (assert true)

;; closed__post__dispatch_axiom
  (assert true)

;; synchronized_file_system__s_file__compat_axiom
  (assert
  (forall ((f us_rep1))
  (! (=> (closed__function_guard3 (closed3 us_tag1 f) us_tag1 f)
     (and (forall ((f1 us_rep1)) (closed__function_guard2 (closed2 f1) f1))
     (= (ite (closed2 f) 1 0) (ite (closed3 us_tag1 f) 1 0)))) :pattern (
  (closed3 us_tag1 f)) )))

(declare-const i22s us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun default_initial_assumption1 ((temp___expr_175 us_rep)
  (temp___skip_top_level_176 Bool)) Bool (= (attr__tag temp___expr_175) 
  us_tag))

;; closed__post_axiom
  (assert true)

;; closed__post__dispatch_axiom
  (assert true)

;; synchronized_file_system__s_file__compat_axiom
  (assert
  (forall ((f us_rep))
  (! (=> (closed__function_guard1 (closed1 us_tag1 f) us_tag1 f)
     (and
     (forall ((f1 us_rep)) (closed__function_guard2 (closed2 (of_base f1))
     (of_base f1)))
     (= (ite (closed2 (of_base f)) 1 0) (ite (closed1 us_tag1 f) 1 0)))) :pattern (
  (closed1 us_tag1 f)) )))

;; file_system__file__compat_axiom
  (assert
  (forall ((f us_rep))
  (! (=> (closed__function_guard1 (closed1 us_tag f) us_tag f)
     (and (forall ((f1 us_rep)) (closed__function_guard (closed f1) f1))
     (= (ite (closed f) 1 0) (ite (closed1 us_tag f) 1 0)))) :pattern (
  (closed1 us_tag f)) )))

(define-fun dynamic_invariant3 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 2)) (in_range3 temp___expr_166)))

(assert
;; defqtvc
 ;; File "synchronized_file_system.ads", line 8, characters 0-0
  (not
  (forall ((f__split_fields us_split_fields2)
  (f__split_fields1 us_split_fields2))
  (=> (dynamic_invariant i22s true false true true)
  (=> (dynamic_invariant i22s true false true true)
  (=> (dynamic_invariant (us_repqtmk1 f__split_fields f__attr__tag) false
  false true true)
  (=> (dynamic_invariant (us_repqtmk1 f__split_fields1 f__attr__tag) true
  true true true)
  (=>
  (forall ((f__split_fields2 us_split_fields2)) (closed__function_guard2
  (closed2 (us_repqtmk1 f__split_fields2 f__attr__tag))
  (us_repqtmk1 f__split_fields2 f__attr__tag)))
  (=> (= (closed2 (us_repqtmk1 f__split_fields1 f__attr__tag)) true)
  (=>
  (forall ((f__split_fields2 us_split_fields2)) (closed__function_guard2
  (closed2 (us_repqtmk1 f__split_fields2 f__attr__tag))
  (us_repqtmk1 f__split_fields2 f__attr__tag)))
  (= (closed2 (us_repqtmk1 f__split_fields1 f__attr__tag)) true)))))))))))
(check-sat)
(exit)
